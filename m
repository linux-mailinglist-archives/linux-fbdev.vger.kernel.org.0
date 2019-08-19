Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E36092631
	for <lists+linux-fbdev@lfdr.de>; Mon, 19 Aug 2019 16:10:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbfHSOKk (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 19 Aug 2019 10:10:40 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:36597 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726028AbfHSOKk (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 19 Aug 2019 10:10:40 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190819141038euoutp019fb8127254560567bd0955926a23fd23~8WEh2Daa91959819598euoutp01i
        for <linux-fbdev@vger.kernel.org>; Mon, 19 Aug 2019 14:10:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190819141038euoutp019fb8127254560567bd0955926a23fd23~8WEh2Daa91959819598euoutp01i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1566223838;
        bh=T/LjUcSz1eg/3smCmPpW2tdKhExF4rDrtpcLfInnC94=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=VO6i5gbJ1jslWsxi5KUVbeD7owESC0SS8BOr0/I3+s5LfQ4K1/7kZyCQj5XZPZibq
         70BtcX2GpYb75d87PRPp3IgToTclKrehqxuAaNE4DdWY157Idcwr5XVQICdMiGn6az
         fr0+T4axEvtDrm43jO6f9wCgsNMcq+BlY8cQh2vI=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190819141038eucas1p216e744fa1802e46452432bbd6a7fd868~8WEhe_8RV0319403194eucas1p2g;
        Mon, 19 Aug 2019 14:10:38 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 18.15.04374.DDDAA5D5; Mon, 19
        Aug 2019 15:10:37 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190819141037eucas1p11f27f71e69d208915c80085e9964c78c~8WEgs5mpZ0501305013eucas1p1U;
        Mon, 19 Aug 2019 14:10:37 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190819141037eusmtrp2def4531a2e43b9852e642cd5ba24ec74~8WEgeKDeE0231102311eusmtrp2r;
        Mon, 19 Aug 2019 14:10:37 +0000 (GMT)
X-AuditID: cbfec7f5-4f7ff70000001116-63-5d5aadddeb48
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 7F.04.04166.DDDAA5D5; Mon, 19
        Aug 2019 15:10:37 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190819141036eusmtip2e851cbf849f4390fc03a66136fd83d07~8WEgJxRfj1045110451eusmtip2b;
        Mon, 19 Aug 2019 14:10:36 +0000 (GMT)
Subject: Re: [PATCH] udlfb: Make dlfb_ops constant
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     bernie@plugable.com, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <7def8a0f-b634-ba89-0f01-476c37e9a27d@samsung.com>
Date:   Mon, 19 Aug 2019 16:10:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190819075236.1051-1-nishkadg.linux@gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCKsWRmVeSWpSXmKPExsWy7djP87p310bFGpw8am1x8f43FosrX9+z
        WZzo+8BqsWFGC7MDi8fOWXfZPe53H2fyeDq1i83j8ya5AJYoLpuU1JzMstQifbsErozHO8ML
        jjBXLJ37nrmB8StTFyMnh4SAicTi2Q2sILaQwApGifWbnbsYuYDsL4wSfYd/sUM4nxklln2/
        zgrTcX3pS3aIjuWMEg+65CGK3jJKvOv5wQaSEBYwklhzZx6YLSKgJzF/7kVGEJtZIFziwsV7
        YIPYBKwkJravAovzCthJbGw+A3YSi4CqxMa198EWiApESNw/toEVokZQ4uTMJywgNqeArcS3
        t2+ZIWaKS9x6Mp8JwpaX2P52DjPEof3sErsulEDYLhK3v22DekBY4tXxLewQtozE/50gvVxA
        9jpGib8dL5ghnO2MEssn/2ODqLKWOHz8IlA3B9AGTYn1u/Qhwo4SPX8OMIGEJQT4JG68FYS4
        gU9i0rbpzBBhXomONiGIajWJDcs2sMGs7dq5knkCo9IsJJ/NQvLNLCTfzELYu4CRZRWjeGpp
        cW56arFxXmq5XnFibnFpXrpecn7uJkZgWjn97/jXHYz7/iQdYhTgYFTi4fWYFhUrxJpYVlyZ
        e4hRgoNZSYS3Yg5QiDclsbIqtSg/vqg0J7X4EKM0B4uSOG81w4NoIYH0xJLU7NTUgtQimCwT
        B6dUA+O0mm2nT71WSrmz7BfXLd1jd2RDT886InNwcT/XXyeOxjePj3Oee9AR4vhR17vUqMts
        FrPNG1WRLrcy0yvzpriy6ntHlycHvfAN+aB4Y4tT0mypN5+s5O9GqQnwHTFI/5Qb9kcx8bTE
        Nf/q3qKz1xdU2zkzXTGz3xX0kNE1rv05z9dgAaXcH0osxRmJhlrMRcWJAKmyZrAnAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBIsWRmVeSWpSXmKPExsVy+t/xe7p310bFGvzZyGZx8f43FosrX9+z
        WZzo+8BqsWFGC7MDi8fOWXfZPe53H2fyeDq1i83j8ya5AJYoPZui/NKSVIWM/OISW6VoQwsj
        PUNLCz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYzHO8MLjjBXLJ37nrmB8StTFyMnh4SA
        icT1pS/Zuxi5OIQEljJKPNy7DcjhAErISBxfXwZRIyzx51oXG0TNa0aJSf1X2EASwgJGEmvu
        zAOzRQT0JObPvcgIUTSBUeJR+wlGkASzQLjE/d61rCA2m4CVxMT2VWBxXgE7iY3NZ8CuYBFQ
        ldi49j47iC0qECFx5v0KFogaQYmTM5+A2ZwCthLf3r5lhpipLvFn3iUoW1zi1pP5TBC2vMT2
        t3OYJzAKzULSPgtJyywkLbOQtCxgZFnFKJJaWpybnltsqFecmFtcmpeul5yfu4kRGEvbjv3c
        vIPx0sbgQ4wCHIxKPLwe06JihVgTy4orcw8xSnAwK4nwVswBCvGmJFZWpRblxxeV5qQWH2I0
        BXpuIrOUaHI+MM7zSuINTQ3NLSwNzY3Njc0slMR5OwQOxggJpCeWpGanphakFsH0MXFwSjUw
        ih7tmbn4TUpeiR53TF96jbzYwe2mcac93x0+df5SsNGXa0dzdgskvT1jlf6Z/QJnvsOOVNv0
        DyrXzu75sq48WsXp/a8pid3pVomTMqSDP3CdOR3ffWlR/+/m30G7ow6dcRPXC7XyWqQ9t6f5
        3+y7WV9F3B/cvJ6qf7G39NxUpkkCvCuerbt3TYmlOCPRUIu5qDgRAOQlXqm7AgAA
X-CMS-MailID: 20190819141037eucas1p11f27f71e69d208915c80085e9964c78c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190819075250epcas3p207fe8748142f91b3d2d7df7c0803ed2e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190819075250epcas3p207fe8748142f91b3d2d7df7c0803ed2e
References: <CGME20190819075250epcas3p207fe8748142f91b3d2d7df7c0803ed2e@epcas3p2.samsung.com>
        <20190819075236.1051-1-nishkadg.linux@gmail.com>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org


On 8/19/19 9:52 AM, Nishka Dasgupta wrote:
> Static structure dlfb_ops, of type fb_ops, is not used except to be
> copied into another variable. Hence make dlfb_ops constant to protect it
> from unintended modification.
> Issue found with Coccinelle.
> 
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
Patch queued for v5.4, thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
