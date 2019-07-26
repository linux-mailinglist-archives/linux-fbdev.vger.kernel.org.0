Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D676A76D97
	for <lists+linux-fbdev@lfdr.de>; Fri, 26 Jul 2019 17:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727628AbfGZPfY (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 26 Jul 2019 11:35:24 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:39376 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727772AbfGZPc5 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 26 Jul 2019 11:32:57 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 276842002D;
        Fri, 26 Jul 2019 17:32:54 +0200 (CEST)
Date:   Fri, 26 Jul 2019 17:32:52 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH] video: Demote panel timing not found error message
Message-ID: <20190726153252.GA24229@ravnborg.org>
References: <20190726101849.27322-1-thierry.reding@gmail.com>
 <CGME20190726113631epcas1p4159fcc746f1409b6b16c7912968b65d2@epcas1p4.samsung.com>
 <20190726113625.GC20065@ravnborg.org>
 <e9bf4cf5-f4de-0a3b-52f4-67f1ae7af5b9@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9bf4cf5-f4de-0a3b-52f4-67f1ae7af5b9@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=Ikd4Dj_1AAAA:8
        a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=7L-i-rEwBvqOcbVinyQA:9
        a=CjuIK1q_8ugA:10 a=4TTD80GP_VEA:10 a=AjGcO6oz07-iQ99wixmX:22
        a=Vxmtnl_E_bksehYqCbjh:22
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi Bartlomiej Zolnierkiewicz
> 
> Hi Sam,
> 
> On 7/26/19 1:36 PM, Sam Ravnborg wrote:
> > Hi Thierry.
> > 
> > On Fri, Jul 26, 2019 at 12:18:49PM +0200, Thierry Reding wrote:
> >> From: Thierry Reding <treding@nvidia.com>
> >>
> >> Failing to find a panel-timing node is not an error in all cases, so do
> >> not output an error message in that case. Instead turn it into a debug
> >> message and make the drivers that care about it output an error message
> >> of their own.
> > 
> > This is more or less the same as already implmented by Douglas here:
> > https://patchwork.kernel.org/cover/11053243/
> > 
> > Doug's has an extra bug-fix that we shall not miss.
> > 
> > I am waiting for feedback from Bartlomiej before proceeding.
> 
> The patchset is in drm-misc-next tree now.
> 
> > I guess he is on holiday somewhere and will return soon.
> 
> I wish it was the case. ;-)
Well, too hot here for work atm. But the farmers are happy.

Can you maybe find time to respond to this patch:
https://lists.freedesktop.org/archives/dri-devel/2019-July/228051.html

It already got ack from backligt people, but as it touches fbdev
your feedback is required too.

Thanks,

	Sam
