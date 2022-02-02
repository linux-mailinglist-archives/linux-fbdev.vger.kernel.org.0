Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C0204AAD50
	for <lists+linux-fbdev@lfdr.de>; Sun,  6 Feb 2022 01:55:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243808AbiBFAz4 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 5 Feb 2022 19:55:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241447AbiBFAz4 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Sat, 5 Feb 2022 19:55:56 -0500
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com [91.221.196.215])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FA17C061348
        for <linux-fbdev@vger.kernel.org>; Sat,  5 Feb 2022 16:55:55 -0800 (PST)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
        by mx1.smtp.larsendata.com (Halon) with ESMTPS
        id 9af17c18-8457-11ec-b20b-0050568c148b;
        Wed, 02 Feb 2022 18:40:33 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sam@ravnborg.org)
        by mail01.mxhotel.dk (Postfix) with ESMTPSA id 8515B194B6C;
        Wed,  2 Feb 2022 19:39:34 +0100 (CET)
Date:   Wed, 2 Feb 2022 19:39:32 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-fbdev@vger.kernel.org,
        DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: fbdev git tree update
Message-ID: <YfrP5AELHkN85/z4@ravnborg.org>
References: <e1e5b7d1-ea09-6e28-9c39-45b983734a85@gmx.de>
 <YfrFvfZuZM1N9frh@ravnborg.org>
 <76ed4203-1ddc-1bbf-39c8-7cb62de7f4e9@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <76ed4203-1ddc-1bbf-39c8-7cb62de7f4e9@gmx.de>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi Helge,

> 
> > How come there are backlight, dt-bindings
> 
> I didn't know, and I picked up those at the beginning.
> I did agreed with the backlight maintainers that I should
> keep those which are already in my tree, and that I will ignore
> any upcoming new ones.
Fine, just include this in the cover letter to explain it.


> > and agp in between the fbdev patches?
> 
> It wasn't picked up yet, agp somehow belongs to fbdev and as
> maintainer for parisc I was somehow involved as well.
> I'm happy to drop it if you think it belongs somewhere else...

I see no point in dropping as you are involved and patch seems relevant.
But please explain this in the cover letter so readers are not left
wondering.

	Sam
