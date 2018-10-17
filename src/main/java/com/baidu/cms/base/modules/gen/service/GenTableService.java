/**
 *
 */
package com.baidu.cms.base.modules.gen.service;

import com.baidu.cms.base.modules.gen.dao.GenDataBaseDictDao;
import com.baidu.cms.base.modules.gen.dao.GenTableColumnDao;
import com.baidu.cms.base.modules.gen.dao.GenTableDao;
import com.baidu.cms.base.modules.gen.entity.GenTable;
import com.baidu.cms.base.modules.gen.entity.GenTableColumn;
import com.baidu.cms.base.modules.gen.util.GenUtils;
import com.baidu.cms.common.persistence.Page;
import com.baidu.cms.common.service.BaseService;
import com.baidu.cms.common.utils.DbUtil;
import com.baidu.cms.common.utils.StringUtils;
import com.baidu.cms.datasources.DataSourceNames;
import com.baidu.cms.datasources.DynamicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * 业务表Service
 * @author Idea
 * @version 2013-10-15
 */
@Service
@Transactional(readOnly = true)
public class GenTableService extends BaseService {

	@Autowired
	private GenTableDao genTableDao;
	@Autowired
	private GenTableColumnDao genTableColumnDao;
	@Autowired
	private GenDataBaseDictDao genDataBaseDictDao;
	
	public GenTable get(String id) {
		GenTable genTable = genTableDao.get(id);
		GenTableColumn genTableColumn = new GenTableColumn();
		genTableColumn.setGenTable(new GenTable(genTable.getId()));
		genTable.setColumnList(genTableColumnDao.findList(genTableColumn));
		return genTable;
	}
	
	public Page<GenTable> find(Page<GenTable> page, GenTable genTable) {
		genTable.setPage(page);
		page.setList(genTableDao.findList(genTable));
		return page;
	}

	public List<GenTable> findAll() {
		return genTableDao.findAllList(new GenTable());
	}
	
	/**
	 * 获取物理数据表列表
	 * @param genTable
	 * @return
	 */
	public List<GenTable> findTableListFormDb(GenTable genTable){
		List<GenTable> tableList = genDataBaseDictDao.findTableList(genTable);
		return tableList;
	}
	
	/**
	 * 验证表名是否可用，如果已存在，则返回false
	 * @param tableName
	 * @return
	 */
	public boolean checkTableName(String tableName){
		if (StringUtils.isBlank(tableName)){
			return true;
		}
		GenTable genTable = new GenTable();
		genTable.setName(tableName);
		List<GenTable> list = new ArrayList<GenTable>();
		try {
			list = genTableDao.findList(genTable);
		} catch (Exception e) {
			// Nothing to do
		}
		return list.size() == 0;
	}
	
	/**
	 * 获取物理数据表列表
	 * @param genTable
	 * @return
	 */
	public GenTable getTableFormDb(GenTable genTable){
		// 如果有表名，则获取物理表
		if (StringUtils.isNotBlank(genTable.getName())){

			// TODO 如果主库没查到，查从库，待优化
			List<GenTable> list = null;
			DataSourceNames[] enums = DataSourceNames.values();
			for (DataSourceNames e : enums) {
				// 根据数据库路由key切换数据源
				DynamicDataSource.setDataSource(e.getKey());
				list = genDataBaseDictDao.findTableList(genTable);
				DynamicDataSource.clearDataSource();
				if (!CollectionUtils.isEmpty(list)) {
					break;
				}
			}

			if (list.size() > 0){
				// 如果是新增，初始化表属性
				if (StringUtils.isBlank(genTable.getId())){
					genTable = list.get(0);
					// 设置字段说明
					if (StringUtils.isBlank(genTable.getComments())){
						genTable.setComments(genTable.getName());
					}
					genTable.setClassName(StringUtils.toCapitalizeCamelCase(genTable.getName()));
				}

				// 根据数据库名取得数据库的路由key
//				String tableSchema = genTable.getTableSchema();
//				String dataSourceKey = DbUtil.getDataSourceKey(tableSchema);
//				// 根据数据库路由key切换数据源
//				DynamicDataSource.setDataSource(dataSourceKey);
//				List<GenTableColumn> columnList = genDataBaseDictDao.findTableColumnList(genTable);
//				DynamicDataSource.clearDataSource();

				List<GenTableColumn> columnList = null;
				for (DataSourceNames e : enums) {
					// 根据数据库路由key切换数据源
					DynamicDataSource.setDataSource(e.getKey());
					columnList = genDataBaseDictDao.findTableColumnList(genTable);
					DynamicDataSource.clearDataSource();
					if (!CollectionUtils.isEmpty(columnList)) {
						break;
					}
				}

				for (GenTableColumn column : columnList){
					boolean b = false;
					for (GenTableColumn e : genTable.getColumnList()){
						if (e.getName().equals(column.getName())){
							b = true;
						}
					}
					if (!b){
						genTable.getColumnList().add(column);
					}
				}
				
				// 删除已删除的列
				for (GenTableColumn e : genTable.getColumnList()){
					boolean b = false;
					for (GenTableColumn column : columnList){
						if (column.getName().equals(e.getName())){
							b = true;
						}
					}
					if (!b){
						e.setDelFlag(GenTableColumn.DEL_FLAG_DELETE);
					}
				}
				
				// 获取主键
				genTable.setPkList(genDataBaseDictDao.findTablePK(genTable));
				
				// 初始化列属性字段
				GenUtils.initColumnField(genTable);
				
			}
		}
		return genTable;
	}
	
	@Transactional(readOnly = false)
	public void save(GenTable genTable) {
		if (StringUtils.isBlank(genTable.getId())){
			genTable.preInsert();
			genTableDao.insert(genTable);
		}else{
			genTable.preUpdate();
			genTableDao.update(genTable);
		}
		// 保存列
		for (GenTableColumn column : genTable.getColumnList()){
			column.setGenTable(genTable);
			if (StringUtils.isBlank(column.getId())){
				column.preInsert();
				genTableColumnDao.insert(column);
			}else{
				column.preUpdate();
				genTableColumnDao.update(column);
			}
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(GenTable genTable) {
		genTableDao.delete(genTable);
		genTableColumnDao.deleteByGenTableId(genTable.getId());
	}
	
}
