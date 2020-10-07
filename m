Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B39F286409
	for <lists+linux-fbdev@lfdr.de>; Wed,  7 Oct 2020 18:30:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727927AbgJGQaf (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 7 Oct 2020 12:30:35 -0400
Received: from sonic313-13.consmr.mail.bf2.yahoo.com ([74.6.133.123]:39283
        "EHLO sonic313-13.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727908AbgJGQaf (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 7 Oct 2020 12:30:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1602088233; bh=PxMwWzXvs+dqOoH0/FHvFmQpYH2JguaCUHYAVLLmaiw=; h=Date:From:Reply-To:Subject:References:From:Subject; b=Xveu13YBQiHv317sGkFgvikmy3mava58k2VVfYBA/1XyzTXAspxIZuO+B5LhJllyq5ICjyg/z/WSQ0bKXFANgygpBrZE+htXBphnIF4p0ATEgQ2a6RxG9ZqiudJu6fqV7w4+DUR1ReRxyhfryQOQIbUSyWoK9MjtlNETouovt80MWpnqCqUjjF+0rOtnJlbHOe5s/fyXZ7M06MeY5ebOedjIuaiPnEcv78eHegRfgE0VwDUhIfOS57u8sYu3KUz0F9qwi4Svjxz61f0jyWcV2bCm9coFjBwdvH+BKJ2npyar+iK9KH2d4fdy7TlYXAqu/hSFtbNGlfB+qAsP2ND93A==
X-YMail-OSG: xOC7ozAVM1mQHi7BAvhOII7MTxYE_Z2ypiHIDcDDl8vL50ooACzNzJBQHxM.QIL
 CuxYNg5KcS5Nicx4txjt9pys6E7jqO.1GhvR5h33hqkwXqShyX5.C.S2kWHNgNQAIl_mXUTAKzkT
 4Q1RQuwTUqhnAn9rPDz..C37w_1WJIoMXVJx5eX1MXd0Wxj7IMVbIPu0RZpKbTOKvNP76Ur9cfFN
 DGwWLMPzYZGvQxInxFwuV2OFPr7KSnxwsZu3nS_apjIvarjBWgrwwGxgiEUUuiQnrNhghwZtTJpK
 GC7FSCPn6nT4L8SYXqsKtv3oulhyjFXzBbr6RiJvS_KDD7lkzmgVOUSxSkRB6dXHLkeOXSse9P8P
 xOdpUQgNJovI_d5dKboGY9ULQF2ldKW5tTFVyDIM2UPeTufLg70qtqYyp2eLRkvNyeYxqjkiPrNm
 PDWXBMGQij8xQZwirrqRWx.H6w.Vha1fOKs_mCNhJnA1FQtbvzG6XZuhGkW4oZrk7anKaqr5rKYV
 7OjV_qtozRbF5bVfP7WH6OdkD_Iew9sRqagLqXwvLk9yqFOTXOLplcm1z5e2J2txEHSqi4CBiYWr
 TB3HeDtwbUWapOaWh5L6v7PN5VwloCKX0OQ27MC33a1nMzVEBbfrM3ZuwWYf9LT1N2ijOCwsYz4G
 wVYUFCOjOM7.SF33oS47Y1.jHrOmH8yT8bVQV1dkIQB776VBGMKs3RWfmaA9SaVd5Yc7gVW_Ss9E
 stzCFJZStta0ff2JMuq6PxQrZ4dqvdKgsd_G2n0orjOWfBNpqzIqhNwULR9ec56vGkRhMj9nh53u
 NGe_KxfWO1wHUndx.K24d9yePQRSjjK.kU6lmmS8sJS0NXGPh9If_xfx8nzQmvq.V8l5xDb0OrIB
 vEJJXoNt9St2NCidNBBpiG66wMb2D9fRnwfBIT9PmPwGDivZA5CvWd7e2OMQ1l.SG4KW2ALLjCOb
 vruHHN8GB7j2N44rOW3788v1Wp9TUvPg427I4IHTYaErX7Q5XhTlF20nBt6daXU_FzuwZrcjw34c
 tjhCQsP.UgcY5Plsifow1mweOsNCanaoPsk.P841luTTQAihyvQcLsqC9se44fwRyA_iPmWB2VWL
 7vOMRxjZcHfiMQilRwQBe1B14C6qW6tk_ZXWTYVQ9Fct4d6HLZIYagy6iIKx6OGWwmawVbtJYNri
 eUkDFT9.caB2Z_I0e1y1q4im8QwFUPhwIkciibQY1i8O5XH74NafHwJ1xK_UbZd_9Htt4L1H7apK
 jrF3eRaPgn_3Dgwn1oYCnrzmb5upHnYj31nydT7r9HA.3dYRAUGWtnxG5B8t89Rm88ShEejjynPa
 9fL1TCaq5rzbpE9OMx4y3gO1XCWTTvpE3Zc5r3nHEOdLsLxWBIWbR3lbPrd3oJpRhwDgomjZ5m5k
 qj2o4IqOUoyMDRACHBmEi9IIqQ61VLQ2mznE7F6e.
Received: from sonic.gate.mail.ne1.yahoo.com by sonic313.consmr.mail.bf2.yahoo.com with HTTP; Wed, 7 Oct 2020 16:30:33 +0000
Date:   Wed, 7 Oct 2020 16:30:01 +0000 (UTC)
From:   Marilyn Robert <fredodinga22@gmail.com>
Reply-To: marilyobert@gmail.com
Message-ID: <1346318531.150693.1602088201295@mail.yahoo.com>
Subject: =?UTF-8?B?0J3QsNGY0LzQuNC70LAg0LrQsNGYINCz0L7RgdC/0L7QtNCw0YDQvtGC?=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
References: <1346318531.150693.1602088201295.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16795 YMailNodin Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

DQoNCtCd0LDRmNC80LjQu9CwINC60LDRmCDQs9C+0YHQv9C+0LTQsNGA0L7Rgg0KDQrQiNCw0YEg
0YHRg9C8IDY4LdCz0L7QtNC40YjQvdCwINC20LXQvdCwLCDQutC+0ZjQsCDRgdGC0YDQsNC00LAg
0L7QtCDQv9GA0L7QtNC+0LvQttC10L0g0LrQsNGA0YbQuNC90L7QvCDQvdCwINC00L7RmNC60LAs
INC+0LQg0YHQuNGC0LUg0LzQtdC00LjRhtC40L3RgdC60Lgg0LjQvdC00LjQutCw0YbQuNC4LCDQ
vNC+0ZjQsNGC0LAg0YHQvtGB0YLQvtGY0LHQsCDQvdCw0LLQuNGB0YLQuNC90LAg0YHQtSDQstC7
0L7RiNC4INC4INC+0YfQuNCz0LvQtdC00L3QviDQtSDQtNC10LrQsCDQvNC+0LbQtdCx0Lgg0L3Q
tdC80LAg0LTQsCDQttC40LLQtdCw0Lwg0L/QvtCy0LXRnNC1INC+0LQg0YjQtdGB0YIg0LzQtdGB
0LXRhtC4INC60LDQutC+INGA0LXQt9GD0LvRgtCw0YIg0L3QsCDQsdGA0LfQuNC+0YIg0YDQsNGB
0YIg0Lgg0LHQvtC70LrQsNGC0LAg0YjRgtC+INGB0LUg0ZjQsNCy0YPQstCwINC60LDRmCDQvdC1
0LAuINCc0L7RmNC+0YIg0YHQvtC/0YDRg9CzINC/0L7Rh9C40L3QsCDQvdC10LrQvtC70LrRgyDQ
s9C+0LTQuNC90Lgg0L3QsNC90LDQt9Cw0LQg0Lgg0L3QsNGI0LjRgtC1INC00L7Qu9Cz0Lgg0LPQ
vtC00LjQvdC4INCx0YDQsNC6INC90LUg0LHQtdCwINCx0LvQsNCz0L7RgdC70L7QstC10L3QuCDR
gdC+INC90LjRgtGDINC10LTQvdC+INC00LXRgtC1LCDQv9C+INC90LXQs9C+0LLQsNGC0LAg0YHQ
vNGA0YIg0LPQviDQvdCw0YHQu9C10LTQuNCyINGG0LXQu9C+0YLQviDQvdC10LPQvtCy0L4g0LHQ
vtCz0LDRgtGB0YLQstC+Lg0KDQrQlNC+0LDRk9Cw0Lwg0LrQsNGYINCy0LDRgSDQvtGC0LrQsNC6
0L4g0YHQtSDQv9C+0LzQvtC70LjQsiDQt9CwINGC0L7QsCwg0L/QvtC00LPQvtGC0LLQtdC9INGB
0YPQvCDQtNCwINC00L7QvdC40YDQsNC8INGB0YPQvNCwINC+0LQgMiwgMzAwLCAwMDAg0LXQstGA
0LAg0LfQsCDQv9C+0LzQvtGIINC90LAg0YHQuNGA0L7QvNCw0YjQvdC40YLQtSwg0YHQuNGA0L7Q
vNCw0YjQvdC40YLQtSDQuCDQv9C+0LzQsNC70LrRgyDQv9GA0LjQstC40LvQtdCz0LjRgNCw0L3Q
uNGC0LUg0LzQtdGT0YMg0LLQsNGI0LjRgtC1INGB0L7QsdGA0LDQvdC40ZjQsCAvINC+0L/RiNGC
0LXRgdGC0LLQvi4g0JfQsNCx0LXQu9C10LbQtdGC0LUg0LTQtdC60LAg0L7QstC+0Zgg0YTQvtC9
0LQg0LUg0LTQtdC/0L7QvdC40YDQsNC9INCy0L4g0LHQsNC90LrQsCDQutCw0LTQtSDRiNGC0L4g
0YDQsNCx0L7RgtC10YjQtSDQvNC+0ZjQvtGCINGB0L7Qv9GA0YPQsy4gQXBwcmVjaWF0ZdC1INGG
0LXQvdCw0Lwg0LDQutC+INC+0LHRgNC90LXRgtC1INCy0L3QuNC80LDQvdC40LUg0L3QsCDQvNC+
0LXRgtC+INCx0LDRgNCw0ZrQtSDQt9CwINC/0YDQvtC/0LDQs9C40YDQsNGa0LUg0L3QsCDQvNCw
0YHQsNC20LDRgtCwINC90LAg0LrRgNCw0LvRgdGC0LLQvtGC0L4sINGc0LUg0LLQuCDQtNCw0LTQ
sNC8INC/0L7QstC10ZzQtSDQtNC10YLQsNC70Lgg0LfQsCDRgtC+0LAg0LrQsNC60L4g0LTQsCDQ
v9C+0YHRgtCw0L/QuNGC0LUuDQoNCtCR0LvQsNCz0L7QtNCw0YDQsNC8DQrQky3Rk9CwINCc0LXR
gNC40LvQuNC9INCg0L7QsdC10YDRgg==
