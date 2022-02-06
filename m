Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B866F4AAD23
	for <lists+linux-fbdev@lfdr.de>; Sun,  6 Feb 2022 01:12:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232988AbiBFAMl (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 5 Feb 2022 19:12:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbiBFAMl (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Sat, 5 Feb 2022 19:12:41 -0500
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com [91.221.196.228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBFE9C061348
        for <linux-fbdev@vger.kernel.org>; Sat,  5 Feb 2022 16:12:38 -0800 (PST)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
        by mx2.smtp.larsendata.com (Halon) with ESMTPS
        id 8e33124d-8451-11ec-ac19-0050568cd888;
        Wed, 02 Feb 2022 17:57:15 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sam@ravnborg.org)
        by mail01.mxhotel.dk (Postfix) with ESMTPSA id 2E168194B1A;
        Wed,  2 Feb 2022 18:56:16 +0100 (CET)
Date:   Wed, 2 Feb 2022 18:56:13 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-fbdev@vger.kernel.org,
        DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: fbdev git tree update
Message-ID: <YfrFvfZuZM1N9frh@ravnborg.org>
References: <e1e5b7d1-ea09-6e28-9c39-45b983734a85@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1e5b7d1-ea09-6e28-9c39-45b983734a85@gmx.de>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi Helge,

On Sun, Jan 30, 2022 at 10:05:39PM +0100, Helge Deller wrote:
> Hello DRI and fbdev developers,
> 
> I've now mostly checked all queued-up patches on the fbdev mailing list:
> https://patchwork.kernel.org/project/linux-fbdev/list/

Nice to see all the pending fbdev patches processed.

I do not see why most of them are applied - why bother with
dev_err_probe or spelling fixes in old drivers that does not see any
active development. But that's your call.

How come there are backlight, dt-bindings and agp in between
the fbdev patches?
It would be nice to be able to trust that if the fbdev tree has patches
then it is mentioned when the tree touches files outside the fbdev
dir.


These are the patches that caught my eye:

> Arnd Bergmann (1):
>       agp: define proper stubs for empty helpers
> 
> Luca Weiss (2):
>       backlight: qcom-wled: Add PM6150L compatible
>       dt-bindings: simple-framebuffer: allow standalone compatible
> 
> Xu Wang (2):
>       backlight: lm3630a_bl: Remove redundant 'flush_workqueue()' calls

If this was mentioned then fine - but now it looks like patches that do
not belong here.

	Sam
