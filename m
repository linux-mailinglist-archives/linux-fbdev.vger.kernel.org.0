Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7E02A1BB0
	for <lists+linux-fbdev@lfdr.de>; Thu, 29 Aug 2019 15:43:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbfH2NnN (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 29 Aug 2019 09:43:13 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:50588 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbfH2NnM (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 29 Aug 2019 09:43:12 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190829134310euoutp02ca14ff3f7a949aa6e89b64709b3f7d00~-aJZ2r1P31872218722euoutp02f
        for <linux-fbdev@vger.kernel.org>; Thu, 29 Aug 2019 13:43:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190829134310euoutp02ca14ff3f7a949aa6e89b64709b3f7d00~-aJZ2r1P31872218722euoutp02f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1567086190;
        bh=SCznab7J6ry5ABzOP+Jykqx8YqoZ9vnjULjnBcxD5hU=;
        h=From:Subject:To:Cc:Date:References:From;
        b=kTsGF8P3tuaxM8dCEagQsMXNzuzMp1EHZs3nF4p8Q29yfEhkgHLRjeXktgYSCwavR
         l8xxKGmxk3wl+lxpt2lSQEGPCdajWzJNGaNwF+ahKjxTc9ONzXFbqkUzbYudKyLLRm
         n42zXu/wX4TOSqEk202dtX+X12r2ZZJsn0ppwBNc=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190829134310eucas1p21ade97e0886aee12a8f0166a515d78b7~-aJZgSV3R1502715027eucas1p2q;
        Thu, 29 Aug 2019 13:43:10 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id CC.BD.04469.D66D76D5; Thu, 29
        Aug 2019 14:43:10 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190829134309eucas1p236b628cd1e268d93c0cb40eef577366b~-aJYpVvOD1976019760eucas1p2F;
        Thu, 29 Aug 2019 13:43:09 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190829134309eusmtrp2ceba15f230fcc3b2680a295a493d2de5~-aJYazJLb2474524745eusmtrp2T;
        Thu, 29 Aug 2019 13:43:09 +0000 (GMT)
X-AuditID: cbfec7f2-54fff70000001175-02-5d67d66de176
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id C5.8B.04117.D66D76D5; Thu, 29
        Aug 2019 14:43:09 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190829134309eusmtip17194130c7a158011708c395af10bd2fb~-aJYPY3Br1513615136eusmtip1f;
        Thu, 29 Aug 2019 13:43:09 +0000 (GMT)
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: no handling of fbdev patches by me till 23.09
To:     linux-fbdev@vger.kernel.org
Cc:     dri-devel@lists.freedesktop.org
Message-ID: <e40392d0-c0d4-0875-018e-3dd0b9716979@samsung.com>
Date:   Thu, 29 Aug 2019 15:43:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkleLIzCtJLcpLzFFi42LZduzned28a+mxBhc0LK58fc9mcaLvA6sD
        k8f97uNMHp83yQUwRXHZpKTmZJalFunbJXBl3Nm3lr3gNWPF7kmfWRoY9zJ2MXJySAiYSKxZ
        84+ti5GLQ0hgBaPEtFVLWSGcL4wSXxc0MUM4nxkleu5cYYFp2f92I1i7kMByRoml10wh7LeM
        En8OyoLYbAJWEhPbV4HVCAuYSXx+NYsNxBYRkJfY09/OBGIzCyhLfDv8AqyGV8BOYsmMZawg
        NouAqsTlHU/A6kUFIiTuH9vAClEjKHFy5hMWiF5xiVtP5kPNkZfY/nYO2KESArfZJO5cPMsK
        caiLxIc5N5ghbGGJV8e3sEPYMhL/d4I0gzSsY5T42/ECqns7o8Tyyf/YIKqsJQ4fvwg0iQNo
        habE+l36EGFHiXc7v7GDhCUE+CRuvBWEOIJPYtK26cwQYV6JjjYhiGo1iQ3LNrDBrO3auRLq
        HA+J75tWM01gVJyF5LVZSF6bheS1WQg3LGBkWcUonlpanJueWmyYl1quV5yYW1yal66XnJ+7
        iRGYME7/O/5pB+PXS0mHGAU4GJV4eGccSI8VYk0sK67MPcQowcGsJML7SCU1Vog3JbGyKrUo
        P76oNCe1+BCjNAeLkjhvNcODaCGB9MSS1OzU1ILUIpgsEwenVAOjmKpju+yFkLrLES9WKj4s
        mGv960JYYLnAhagXf5j+sn1xCnpnnzGT+UXYvPXTU/993bZ0Ov/tz3MsW+7ZKNeqvG/+M2Wp
        VlZUefGpWTe/Ofqot9jP5c7Y6V7LP8dG7qZp7eHuGZt8F8RbaRy8sDsxYyHPte/1Tw98Xumv
        faAj/PjhZ6sK5xq9UGIpzkg01GIuKk4EAN5m2eIUAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrDLMWRmVeSWpSXmKPExsVy+t/xu7q519JjDY4/57G48vU9m8WJvg+s
        Dkwe97uPM3l83iQXwBSlZ1OUX1qSqpCRX1xiqxRtaGGkZ2hpoWdkYqlnaGwea2VkqqRvZ5OS
        mpNZllqkb5egl3Fn31r2gteMFbsnfWZpYNzL2MXIySEhYCKx/+1GIJuLQ0hgKaPEnKPzgBwO
        oISMxPH1ZRA1whJ/rnWxQdS8ZpRY9XUVM0iCTcBKYmL7KrBBwgJmEp9fzWIDsUUE5CX29Lcz
        gdjMAsoS3w6/AKvhFbCTWDJjGSuIzSKgKnF5xxOwelGBCIkz71ewQNQISpyc+YQFoldd4s+8
        S8wQtrjErSfzoWbKS2x/O4d5AqPALCQts5C0zELSMgtJywJGllWMIqmlxbnpucVGesWJucWl
        eel6yfm5mxiBIb/t2M8tOxi73gUfYhTgYFTi4bXYnh4rxJpYVlyZe4hRgoNZSYT3kUpqrBBv
        SmJlVWpRfnxRaU5q8SFGU6CHJjJLiSbnA+MxryTe0NTQ3MLS0NzY3NjMQkmct0PgYIyQQHpi
        SWp2ampBahFMHxMHp1QD48I/cmvC2ec7rYysOzFLff7DJ28kzFM+bkhub2eoioxRYLrRafnv
        QknIWg4RrbCe/eZ/7qdJBi7dUG86Y4/c78gJv3VEvW/En3t90yJQqfXbK1XuwDnXM248CE6W
        Z167+Yvms6h/v9Vtq27ceBVxp+CqIs9nIZNjT0MO3D+7RGu1T+jsz8d93ZRYijMSDbWYi4oT
        AeCJ4nOPAgAA
X-CMS-MailID: 20190829134309eucas1p236b628cd1e268d93c0cb40eef577366b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190829134309eucas1p236b628cd1e268d93c0cb40eef577366b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190829134309eucas1p236b628cd1e268d93c0cb40eef577366b
References: <CGME20190829134309eucas1p236b628cd1e268d93c0cb40eef577366b@eucas1p2.samsung.com>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi,

I will be traveling / busy with other things / without access to my
development setup till 23.09. Sorry for the inconvenience.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
