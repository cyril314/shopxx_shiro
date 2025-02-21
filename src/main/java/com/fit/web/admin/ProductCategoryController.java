package com.fit.web.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fit.base.BaseController;
import com.fit.base.R;
import com.fit.config.shiro.ShiroMessage;
import com.fit.entity.ProductCategory;
import com.fit.service.ProductCategoryService;
import com.fit.service.ProductQuestionService;
import com.fit.util.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * Controller - 商品分类
 */
@Controller
@RequestMapping("/admin/product_category")
public class ProductCategoryController extends BaseController {

    @Autowired
    private ShiroMessage shiroMessage;
    @Autowired
    private ProductCategoryService productCategoryService;
    @Autowired
    private ProductQuestionService productQuestionService;

    /**
     * 添加
     */
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(HttpServletRequest request) {
        request.setAttribute("productCategoryTree", productCategoryService.findAll());
        return "/admin/product_category/add";
    }

    /**
     * 列表
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(HttpServletRequest request) {
        List<ProductCategory> all = productCategoryService.findAll();
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        for (ProductCategory productCategory : all) {
            Map<String, Object> map = new HashMap<>();
            map.put("id", productCategory.getId());
            int count = productQuestionService.findCount(map);
            map.clear();
            map = BeanUtils.bean2Map(productCategory);
            map.put("questions", count);
            list.add(map);
        }

        request.setAttribute("productCategoryTree", list);
        return "/admin/product_category/list";
    }

    /**
     * 删除
     */
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public R delete(Long id) {
        ProductCategory productCategory = productCategoryService.get(id);
        if (productCategory == null) {
            return R.error("没有选中.");
        }
        Map<String, Object> param = new HashMap<>();
        param.put("parent", id);
        int count = productCategoryService.findCount(param);
        if (count > 0) {
            return R.error(shiroMessage.getMessage("admin.productCategory.deleteExistChildrenNotAllowed"));
        }
        productCategoryService.delete(id);
        return R.success();
    }

}