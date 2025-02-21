package com.fit.config.freemarker.method;

import java.math.BigDecimal;
import java.util.List;

import com.fit.entity.SysSetting;
import com.fit.service.SysSettingService;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import freemarker.template.SimpleScalar;
import freemarker.template.TemplateMethodModel;
import freemarker.template.TemplateModelException;

/**
 * 模板方法 - 货币格式化
 *
 * @author JIUJIANG Team
 * @version 3.0
 */
@Component("currencyMethod")
public class CurrencyMethod implements TemplateMethodModel {

    @Autowired
    private SysSettingService sysSettingService;

    public Object exec(List arguments) throws TemplateModelException {
        if (arguments != null && !arguments.isEmpty() && arguments.get(0) != null && Strings.isNotEmpty(arguments.get(0).toString())) {
            boolean showSign = false;
            boolean showUnit = false;
            if (arguments.size() == 2) {
                if (arguments.get(1) != null) {
                    showSign = Boolean.valueOf(arguments.get(1).toString());
                }
            } else if (arguments.size() > 2) {
                if (arguments.get(1) != null) {
                    showSign = Boolean.valueOf(arguments.get(1).toString());
                }
                if (arguments.get(2) != null) {
                    showUnit = Boolean.valueOf(arguments.get(2).toString());
                }
            }
            String priceRoundType = sysSettingService.get(1L).getCode().toString();
            int priceScale = Integer.parseInt(sysSettingService.get(1L).getCode().toString());
            String currencySign = sysSettingService.get(1L).getCode().toString();
            String currencyUnit = sysSettingService.get(1L).getCode().toString();
            BigDecimal amount = new BigDecimal(arguments.get(0).toString());
            String price = setScale(amount, priceRoundType, priceScale).toString();
            if (showSign) {
                price = currencySign + price;
            }
            if (showUnit) {
                price += currencyUnit;
            }
            return new SimpleScalar(price);
        }
        return null;
    }

    public enum RoundType {

        /**
         * 四舍五入
         */
        roundHalfUp,

        /**
         * 向上取整
         */
        roundUp,

        /**
         * 向下取整
         */
        roundDown
    }

    public BigDecimal setScale(BigDecimal amount, String priceRoundType, int priceScale) {
        if (amount == null) {
            return null;
        }
        int roundingMode;
        if (priceRoundType == RoundType.roundUp.toString()) {
            roundingMode = BigDecimal.ROUND_UP;
        } else if (priceRoundType == RoundType.roundDown.toString()) {
            roundingMode = BigDecimal.ROUND_DOWN;
        } else {
            roundingMode = BigDecimal.ROUND_HALF_UP;
        }
        return amount.setScale(priceScale, roundingMode);
    }

}