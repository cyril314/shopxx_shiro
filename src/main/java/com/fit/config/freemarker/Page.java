package com.fit.config.freemarker;

import com.fit.config.freemarker.Order.Direction;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * 分页
 */
public class Page<T> implements Serializable {

    /**
     * 内容
     */
    private final List<T> content = new ArrayList<T>();

    /**
     * 总记录数
     */
    private long total;

    /**
     * 页码
     */
    private int pageNumber = 1;

    /**
     * 每页记录数
     */
    private int pageSize = 20;

    /**
     * 搜索属性
     */
    private String searchProperty;

    /**
     * 搜索值
     */
    private String searchValue;

    /**
     * 排序属性
     */
    private String orderProperty;

    /**
     * 排序方向
     */
    private Order.Direction orderDirection;

    /**
     * 筛选
     */
    private List<Filter> filters = new ArrayList<Filter>();

    /**
     * 排序
     */
    private List<Order> orders = new ArrayList<Order>();

    /**
     * 初始化一个新创建的Page对象
     */
    public Page() {
        this.total = 0L;
    }

    /**
     * @param content 内容
     */
    public Page(List<T> content) {
        this.content.addAll(content);
        this.total = this.content.size();
    }

    /**
     * 获取页码
     *
     * @return 页码
     */
    public int getPageNumber() {
        return pageNumber;
    }

    /**
     * 设置页码
     *
     * @param pageNumber 页码
     */
    public void setPageNumber(int pageNumber) {
        if (pageNumber < 1) {
            pageNumber = 1;
        }
        this.pageNumber = pageNumber;
    }

    /**
     * 获取每页记录数
     *
     * @return 每页记录数
     */
    public int getPageSize() {
        return pageSize;
    }

    /**
     * 设置每页记录数
     *
     * @param pageSize 每页记录数
     */
    public void setPageSize(int pageSize) {
        if (pageSize < 1 || pageSize > 1000) {
            pageSize = 20;
        }
        this.pageSize = pageSize;
    }

    /**
     * 获取搜索属性
     *
     * @return 搜索属性
     */
    public String getSearchProperty() {
        return searchProperty;
    }

    /**
     * 设置搜索属性
     *
     * @param searchProperty 搜索属性
     */
    public void setSearchProperty(String searchProperty) {
        this.searchProperty = searchProperty;
    }

    /**
     * 获取搜索值
     *
     * @return 搜索值
     */
    public String getSearchValue() {
        return searchValue;
    }

    /**
     * 设置搜索值
     *
     * @param searchValue 搜索值
     */
    public void setSearchValue(String searchValue) {
        this.searchValue = searchValue;
    }

    /**
     * 获取排序属性
     *
     * @return 排序属性
     */
    public String getOrderProperty() {
        return orderProperty;
    }

    /**
     * 设置排序属性
     *
     * @param orderProperty 排序属性
     */
    public void setOrderProperty(String orderProperty) {
        this.orderProperty = orderProperty;
    }

    /**
     * 获取排序方向
     *
     * @return 排序方向
     */
    public Direction getOrderDirection() {
        return orderDirection;
    }

    /**
     * 设置排序方向
     *
     * @param orderDirection 排序方向
     */
    public void setOrderDirection(Direction orderDirection) {
        this.orderDirection = orderDirection;
    }

    /**
     * 获取排序
     *
     * @return 排序
     */
    public List<Order> getOrders() {
        return orders;
    }

    /**
     * 设置排序
     *
     * @param orders 排序
     */
    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }

    /**
     * 获取筛选
     *
     * @return 筛选
     */
    public List<Filter> getFilters() {
        return filters;
    }

    /**
     * 设置筛选
     *
     * @param filters 筛选
     */
    public void setFilters(List<Filter> filters) {
        this.filters = filters;
    }

    /**
     * 获取总页数
     *
     * @return 总页数
     */
    public int getTotalPages() {
        return (int) Math.ceil((double) getTotal() / (double) getPageSize());
    }

    /**
     * 获取内容
     */
    public List<T> getContent() {
        return content;
    }

    /**
     * 获取总记录数
     */
    public long getTotal() {
        return total;
    }


}