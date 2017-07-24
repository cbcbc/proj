package com.cb.eshop;

import com.cb.eshop.dao.interfaces.IOrderDao;
import com.cb.eshop.service.impl.OrderService;
import com.cb.eshop.service.interfaces.IOrderService;
import org.easymock.EasyMockRunner;
import org.easymock.EasyMockSupport;
import org.easymock.Mock;
import org.easymock.TestSubject;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;

import static org.easymock.EasyMock.*;

@RunWith(EasyMockRunner.class)
public class OrderServiceTest extends EasyMockSupport {

    @Mock
    private IOrderDao orderDao;

    @TestSubject
    private IOrderService orderService = new OrderService();

    @Test
    public void testGetOrderPageNumbersByPurchaserIdAndQueryCriteria() throws Exception {
        Integer count = 13;

        expect(orderDao.selectOrderNumbersByPurchaserIdAndQueryCriteria(anyString()))
                .andReturn(count).times(1);
        replay(orderDao);

        Integer pageNums = count % 10 == 0 ? count / 10 : count / 10 + 1;

        Integer purchaserId = 5;
        String orderId = "1707232014385";
        String startTime = "2017-07-23 20:14:38";
        String overTime = "2017-07-23 20:14:38";
        String orderStatusString = "0";
        Integer pageNums2 = orderService.getOrderPageNumbersByPurchaserIdAndQueryCriteria(purchaserId, orderId, startTime, overTime, orderStatusString);
        verify(orderDao);

        Assert.assertEquals(pageNums, pageNums2);
    }
}
