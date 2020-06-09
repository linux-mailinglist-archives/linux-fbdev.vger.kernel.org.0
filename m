Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B169F1F3847
	for <lists+linux-fbdev@lfdr.de>; Tue,  9 Jun 2020 12:44:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726967AbgFIKo1 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 9 Jun 2020 06:44:27 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:33076 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbgFIKo1 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 9 Jun 2020 06:44:27 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200609104425euoutp0197e26515d44611b858a75028b127742c~W2jsa6s830920709207euoutp01K
        for <linux-fbdev@vger.kernel.org>; Tue,  9 Jun 2020 10:44:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200609104425euoutp0197e26515d44611b858a75028b127742c~W2jsa6s830920709207euoutp01K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1591699465;
        bh=Z1sPMkuHOYTRb8rTMMf1CSXELU1sEysH1ATI+nGcDsU=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=ZfEACQtufE9jlKhzXu+YR+03RYMfGUuh9dkbjZ3LQ42jspc5aMKXydxnPcyruD+wH
         MF3OknDVbIAwNSENVnJvKY/OSVQBHbgpF3YR2orI5xGN2oWUoeRrw/udOucGvR5tAN
         YgGNrCTia9QpxYXXhzgBMkOKAF+kdYTGKNHgau64=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200609104425eucas1p1b1d4e500cb151f643be1de2aada34c96~W2jsR2DsP2403824038eucas1p1U;
        Tue,  9 Jun 2020 10:44:25 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 5C.FF.60679.9086FDE5; Tue,  9
        Jun 2020 11:44:25 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200609104425eucas1p1bc5abb8a0877964f8caa6f285ce61dde~W2jsAQeRi2405324053eucas1p1E;
        Tue,  9 Jun 2020 10:44:25 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200609104425eusmtrp27e0423b0324545e6cab15f6c925b69f5~W2jsADAv93011330113eusmtrp2E;
        Tue,  9 Jun 2020 10:44:25 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-b5-5edf6809c9fc
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 91.5D.08375.9086FDE5; Tue,  9
        Jun 2020 11:44:25 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200609104424eusmtip2d88a5c63ec02504430c0acff9697209d~W2jrsqiPC0988009880eusmtip2v;
        Tue,  9 Jun 2020 10:44:24 +0000 (GMT)
Subject: Re: [Bug Report] drivers/video/fbdev/kyro/fbdev.c: unsigned integer
 wrap-around might cause unexpected behavior
To:     Changming Liu <liu.changm@northeastern.edu>
Cc:     "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "Lu, Long" <l.lu@northeastern.edu>,
        "yaohway@gmail.com" <yaohway@gmail.com>
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <c20a2141-1586-aeb3-abf8-385bb6e498b6@samsung.com>
Date:   Tue, 9 Jun 2020 12:44:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <BL0PR06MB45489A53C61DF15BF2F95B9CE5B70@BL0PR06MB4548.namprd06.prod.outlook.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLKsWRmVeSWpSXmKPExsWy7djP87qcGffjDI7tVLC48vU9m8WeuVIW
        J/o+sFocfHaDzeLytkXMDqweO2fdZfe4332cyaNh2wV2j8+b5AJYorhsUlJzMstSi/TtErgy
        bjW/ZinYzV9xsv85cwPjRZ4uRk4OCQETiQXXX7J3MXJxCAmsYJSYemszI4TzhVFi3tTfLBDO
        Z0aJj/OOMcK0PLy6E6plOaPE801LWSGct4wSv+Y3s4JUCQtUSTxct5QdxBYR0Jd4On8KWAez
        wFVGieuNr5hAEmwCVhIT21eBjeUVsJM4fekuWDOLgIrEtGm32UBsUYEIiU8PDrNC1AhKnJz5
        hAXE5hSIlVgzdRvYHGYBcYlbT+ZD2fIS29/OYQZZJiGwiF3i9s+5rBB3u0g0LbzHBGELS7w6
        voUdwpaR+L8TpBmkYR2jxN+OF1Dd2xkllk/+xwZRZS1x59wvIJsDaIWmxPpd+hBhR4mPe++w
        gIQlBPgkbrwVhDiCT2LStunMEGFeiY42IYhqNYkNyzawwazt2rmSeQKj0iwkr81C8s4sJO/M
        Qti7gJFlFaN4amlxbnpqsVFearlecWJucWleul5yfu4mRmCiOf3v+JcdjLv+JB1iFOBgVOLh
        vSF+L06INbGsuDL3EKMEB7OSCK/T2dNxQrwpiZVVqUX58UWlOanFhxilOViUxHmNF72MFRJI
        TyxJzU5NLUgtgskycXBKNTDybPyXPOvfs3sXhMsnzPK9E3j97M73kSWNu4wX5/NJLTRa9qdg
        64na7xf4e28fkdvw7PNzqdlfHjavN4/rvRB6auLe2MItxk8378u2uTfn5usjR09ErtPbpSDf
        1Dc1xMHJfp9Ey4NZDyzi9xfPqN0pI+A6Jfxn/JHn2s4dm6OChf7c5IlfdpdtlxJLcUaioRZz
        UXEiAO8FeM0wAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRmVeSWpSXmKPExsVy+t/xe7qcGffjDM5+4LW48vU9m8WeuVIW
        J/o+sFocfHaDzeLytkXMDqweO2fdZfe4332cyaNh2wV2j8+b5AJYovRsivJLS1IVMvKLS2yV
        og0tjPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQybjW/ZinYzV9xsv85cwPjRZ4u
        Rk4OCQETiYdXd7J3MXJxCAksZZT4uXYiWxcjB1BCRuL4+jKIGmGJP9e62EBsIYHXjBLXpjCD
        2MICVRIP1y1lB7FFBPQlns6fAjaHWeAqo8Tf9ftYIIZuYJR4/WUpE0gVm4CVxMT2VYwgNq+A
        ncTpS3dZQWwWARWJadNug20QFYiQOLxjFlSNoMTJmU9YQGxOgViJNVO3gc1hFlCX+DPvEjOE
        LS5x68l8qLi8xPa3c5gnMArNQtI+C0nLLCQts5C0LGBkWcUoklpanJueW2yoV5yYW1yal66X
        nJ+7iREYVduO/dy8g/HSxuBDjAIcjEo8vDfE78UJsSaWFVfmHmKU4GBWEuF1Ons6Tog3JbGy
        KrUoP76oNCe1+BCjKdBzE5mlRJPzgRGfVxJvaGpobmFpaG5sbmxmoSTO2yFwMEZIID2xJDU7
        NbUgtQimj4mDU6qBsU+Twyu18Um78HK3hXvdAqIsyrlzL3uvfHrPbEXujlNap6SrLjvFyH4r
        mSmTbKB+pHouk+q+gisVN1n/mm/0XiTvrvPkSfB12VWbhdoFfRpUjOzO5W82cPp6bObqZ4lC
        ticPJbTVOEpN3bhdTZuxxG/6i5AXf9MuLLT0jFxodvp4ae2hw3O3K7EUZyQaajEXFScCAML7
        PujAAgAA
X-CMS-MailID: 20200609104425eucas1p1bc5abb8a0877964f8caa6f285ce61dde
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200521011509eucas1p240099e1e51780beeee80257bfc361e33
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200521011509eucas1p240099e1e51780beeee80257bfc361e33
References: <CGME20200521011509eucas1p240099e1e51780beeee80257bfc361e33@eucas1p2.samsung.com>
        <BL0PR06MB45489A53C61DF15BF2F95B9CE5B70@BL0PR06MB4548.namprd06.prod.outlook.com>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org


Hi,

On 5/21/20 3:15 AM, Changming Liu wrote:
> Hi Bartlomiej,
> Greetings, I'm a first-year PhD student who is interested in the usage of UBSan for linux. 
> And after some experiments, I found that in drivers/video/fbdev/kyro/fbdev.c
> function kyro_dev_overlay_viewport_set, there is an unsigned integer overflow that might cause unexpected behavior.
> 
> More specifically, first at its caller, kyrofb_ioctl, after execution of copy_from_user at line 599, struct ol_viewport_set is filled with data from user space. 
> And the 4 32bit unsigned integers from it are passed into kyro_dev_overlay_viewport_set. In function kyro_dev_overlay_viewport_set, 
> x is added with ulWidth, y is added with ulHeight to transfer the length to the coordinate. 
> And the result coordinate might overflow and wrap around. And it is passed into function SetOverlayViewPort.
> 
> It appears that in function SetOverlayViewPort, these values are treated as the coordinate of the bottom-right point and the wrap-around is not checked.(I might miss something).
> 
> Due to the lack of knowledge of the interaction between this module and the user space, I'm not able to assess if this is a benign wrap-around or whether the wrap-around could happen at all. 
> I'd appreciate for you comment on this issue, this could help me understand linux and unsigned wrap around a lot.
> 
> Looking forward to your valuable response!

It seems that wrap-around can indeed happen but I'm not sure
what are the exact consequences of it (SetOverlayViewPort() is
quite complicated and I also don't know how hardware would
react to improper settings).

kyrofb driver is for legacy devices and is not actively
maintained so I worry that without somebody with the access
to hardware and time to investigate it further I cannot do
much about the problem.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> Best,
> Changming Liu
> 
