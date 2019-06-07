Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AA5438A2F
	for <lists+linux-fbdev@lfdr.de>; Fri,  7 Jun 2019 14:26:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728909AbfFGM0B (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 7 Jun 2019 08:26:01 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:38780 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728597AbfFGM0A (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Fri, 7 Jun 2019 08:26:00 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190607122559euoutp01e1c15361e931eb8d049e0ca358dc1a6f~l6jUdkEOM3019630196euoutp01s
        for <linux-fbdev@vger.kernel.org>; Fri,  7 Jun 2019 12:25:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190607122559euoutp01e1c15361e931eb8d049e0ca358dc1a6f~l6jUdkEOM3019630196euoutp01s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1559910359;
        bh=v55UW7qRKcueFOO4F7D06p3S+rnoOobSIhpjaAMDbnw=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=ajetDQ4u/o85Fuo7OgszrawNg6lMFIq6qjY9097sQx3y1rP6qGHGuKp3u5APbugaZ
         q45ujPeadoAkOgKxqXT00D60EkasrnnrxzvX3EVKm4D+W4+9xCPtWxhLWBWFBDH6AR
         ACCKsuPkrVLRWx67YskG6e7Q43L2ZfjOufEtdHBA=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190607122559eucas1p1d5c895dc98fbc36b3a6532d394d5158c~l6jTyfblQ0424004240eucas1p1h;
        Fri,  7 Jun 2019 12:25:59 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 74.D4.04298.6D75AFC5; Fri,  7
        Jun 2019 13:25:58 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190607122558eucas1p147ed7c29bc60ff99073f4ba67375ad3e~l6jSy4Dd-0422904229eucas1p1c;
        Fri,  7 Jun 2019 12:25:58 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190607122557eusmtrp14c6b9319e71cfd1a95f35383f12c4bee~l6jSjXncA3225232252eusmtrp1V;
        Fri,  7 Jun 2019 12:25:57 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-f2-5cfa57d6fced
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 2F.D7.04146.5D75AFC5; Fri,  7
        Jun 2019 13:25:57 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190607122557eusmtip1f514c8a5b30bdfd4282244140bb9c9ff~l6jSNtPUm2114021140eusmtip1R;
        Fri,  7 Jun 2019 12:25:57 +0000 (GMT)
Subject: Re: [PATCH v3] video: fbdev: atmel_lcdfb: add COMPILE_TEST support
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Nicolas Ferre <nicolas.ferre@microchip.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <7f6b5d26-de84-c38a-7510-fee1f7e7eea3@samsung.com>
Date:   Fri, 7 Jun 2019 14:25:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190601210651.GB3558@piout.net>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNKsWRmVeSWpSXmKPExsWy7djPc7rXwn/FGHycZGDR/m4Zu8WVr+/Z
        LDY9vsZqcaLvA6vF5V1z2CxerL3OarF980JmB3aPeWuqPe53H2fy2Lyk3uPOj6WMHp83yQWw
        RnHZpKTmZJalFunbJXBlfH6wiK3gM3vFyg3PmRsYd7N1MXJySAiYSKxYeJGxi5GLQ0hgBaPE
        rNtXmCCcL4wSd199ZoZwPjNKnDs6iRmm5fvBF2wQieWMEqdalkC1vGWU2PLuBCtIlbCAt8Sy
        LxfBbBEBU4nWxl1gHcwCbxgl3uxaADaKTcBKYmL7KkYQm1fATqL/6l4WEJtFQEXi6LXP7CC2
        qECExP1jG1ghagQlTs58AlbDKaAncfx6J9gcZgFxiVtP5jNB2PIS29/OAbtbQmAbu8TbY2tZ
        IO52keg9txPqbWGJV8e3sEPYMhKnJ/ewQDSsY5T42/ECqns7o8Tyyf+gOqwlDh8H+YcDaIWm
        xPpd+hBhR4kfXR8ZQcISAnwSN94KQhzBJzFp23RmiDCvREebEES1msSGZRvYYNZ27VzJPIFR
        aRaS12YheWcWkndmIexdwMiyilE8tbQ4Nz212DAvtVyvODG3uDQvXS85P3cTIzAJnf53/NMO
        xq+Xkg4xCnAwKvHwerD/jBFiTSwrrsw9xCjBwawkwlt24UeMEG9KYmVValF+fFFpTmrxIUZp
        DhYlcd5qhgfRQgLpiSWp2ampBalFMFkmDk6pBsZI6cXfCprM0iWEdMWDfsc6f7KomPSJU+iD
        Qv4l610zVqlZtbCvTHiRVjo/usJOmkvYeOGz7XHrfh6omdAraxcWu7a/Z7WhfMH9rt+2ShdZ
        dRcy/bgyu61gthrbtO+TZt61L1z0aa73PqdLy7Y92H268d3EVdlcLx7bF33dnf7r4e4uk1ec
        T88osRRnJBpqMRcVJwIAoD56jT4DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRmVeSWpSXmKPExsVy+t/xu7pXw3/FGPw7rG3R/m4Zu8WVr+/Z
        LDY9vsZqcaLvA6vF5V1z2CxerL3OarF980JmB3aPeWuqPe53H2fy2Lyk3uPOj6WMHp83yQWw
        RunZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJalFunbJehlfH6w
        iK3gM3vFyg3PmRsYd7N1MXJySAiYSHw/+ALI5uIQEljKKLFsyyTGLkYOoISMxPH1ZRA1whJ/
        rnVB1bxmlHi68wY7SEJYwFti2ZeLrCC2iICpRGvjLrAiZoE3jBJ/zv9lhOjYxiixueEYE0gV
        m4CVxMT2VYwgNq+AnUT/1b0sIDaLgIrE0WufwaaKCkRInHm/ggWiRlDi5MwnYDangJ7E8eud
        zCA2s4C6xJ95l6BscYlbT+YzQdjyEtvfzmGewCg0C0n7LCQts5C0zELSsoCRZRWjSGppcW56
        brGhXnFibnFpXrpecn7uJkZgzG079nPzDsZLG4MPMQpwMCrx8Dow/IwRYk0sK67MPcQowcGs
        JMJbduFHjBBvSmJlVWpRfnxRaU5q8SFGU6DnJjJLiSbnA9NBXkm8oamhuYWlobmxubGZhZI4
        b4fAwRghgfTEktTs1NSC1CKYPiYOTqkGxpnOC6JDl8nMYZP4mrPC7NPKC6zXDm/IDbn5z/X3
        dM8baif/fTHZYS1qGXnKeZP91P8iDjGSJsFXTlx4svLxwyeOWwx/c65V6Fy77h8by5c/vrqh
        Lzs0YlPcZKTDcixNcu1L9t+RuTn98MT1C1h62q/M4H6jXzv/O/cCbzWR0+emz9x2esNSubNK
        LMUZiYZazEXFiQAbay/ZzwIAAA==
X-CMS-MailID: 20190607122558eucas1p147ed7c29bc60ff99073f4ba67375ad3e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190530123016eucas1p2e18747b8ac1d156657232eab52876a61
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190530123016eucas1p2e18747b8ac1d156657232eab52876a61
References: <CGME20190530123016eucas1p2e18747b8ac1d156657232eab52876a61@eucas1p2.samsung.com>
        <69cd6b8b-1fd1-86fa-2070-99d0ce15a868@samsung.com>
        <20190601210651.GB3558@piout.net>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org


On 6/1/19 11:06 PM, Alexandre Belloni wrote:
> On 30/05/2019 14:30:19+0200, Bartlomiej Zolnierkiewicz wrote:
>> Add COMPILE_TEST support to atmel_lcdfb driver for better compile
>> testing coverage.
>>
>> While at it fix improper use of UL (to silence build warnings on
>> x86_64).
>>
>> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Thanks, I queued the patch for v5.3.

>> Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
>> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
>> ---
>> v3: fix build warnings on x86_64
> 
> Hopefully, no building errors anymore ;)

I hope so. :)

>> v2: add missing HAVE_CLK && HAS IOMEM dependencies
>>
>>  drivers/video/fbdev/Kconfig       |    3 ++-
>>  drivers/video/fbdev/atmel_lcdfb.c |    4 ++--
>>  2 files changed, 4 insertions(+), 3 deletions(-)
Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
