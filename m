Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB4A54C1D13
	for <lists+linux-fbdev@lfdr.de>; Wed, 23 Feb 2022 21:23:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241058AbiBWUXk (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 23 Feb 2022 15:23:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235991AbiBWUXj (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 23 Feb 2022 15:23:39 -0500
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com [91.221.196.228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F4FB4D266
        for <linux-fbdev@vger.kernel.org>; Wed, 23 Feb 2022 12:23:09 -0800 (PST)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
        by mx2.smtp.larsendata.com (Halon) with ESMTPS
        id 75c8b640-94e6-11ec-b2df-0050568cd888;
        Wed, 23 Feb 2022 20:23:28 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sam@ravnborg.org)
        by mail01.mxhotel.dk (Postfix) with ESMTPSA id C38FD194B37;
        Wed, 23 Feb 2022 21:23:10 +0100 (CET)
Date:   Wed, 23 Feb 2022 21:23:04 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, deller@gmx.de, javierm@redhat.com,
        geert@linux-m68k.org, kraxel@redhat.com, ppaalanen@gmail.com,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 3/5] fbdev: Remove trailing whitespaces from
 cfbimgblt.c
Message-ID: <YhaXqKx4zzkWPvCo@ravnborg.org>
References: <20220223193804.18636-1-tzimmermann@suse.de>
 <20220223193804.18636-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220223193804.18636-4-tzimmermann@suse.de>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, Feb 23, 2022 at 08:38:02PM +0100, Thomas Zimmermann wrote:
> Fix coding style. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
