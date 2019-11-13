Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2B4AFB3B1
	for <lists+linux-fbdev@lfdr.de>; Wed, 13 Nov 2019 16:27:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727848AbfKMP1C (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 13 Nov 2019 10:27:02 -0500
Received: from smtp.domeneshop.no ([194.63.252.55]:42799 "EHLO
        smtp.domeneshop.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727721AbfKMP1C (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 13 Nov 2019 10:27:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds201810; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=nGHgOJddUIpu+jP3QRyHjXyjurR1dZDN3bXLHEUAHtA=; b=eZGiolbm/NEogj0OT0HX5ydYLD
        f+yP8PXfwDjJ5bgwA8Ji2MW9eHe3HJiAhCA1Xk/akM/Gq96h4SGPolAtkr0hC8tML0HwHaPOuxgEG
        ebfjdq5CDUr1AS9jIMvwhHyGtUXE98RlWv2k2PsuJgp/5dTfj1m9UOEYPywCkdJTM8PTmu3+V/3ax
        wI2RIc/jq+JkIMAwbNiH6IWjvMQDge70lqKG5fpI8I+mduGafXiLwJIs+mOHpTplcOh6XrCagArvL
        9yN44q3c7zYxwXrDPAY260/PEcUeJR5ID0IOxyTRiMcuN+UYzAvVXElJ3BV9dXUv7/azjgApXRRKs
        NugHDfAg==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:58967 helo=[192.168.10.173])
        by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1iUuXs-0003OP-8a; Wed, 13 Nov 2019 16:27:00 +0100
Subject: Re: [PATCH v4 2/3] drm/fb-helper: Remove drm_fb_helper_unlink_fbi()
To:     Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
        sean@poorly.run, daniel@ffwll.ch, b.zolnierkie@samsung.com,
        kraxel@redhat.com, sam@ravnborg.org, emil.velikov@collabora.com
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20191113115233.18483-1-tzimmermann@suse.de>
 <20191113115233.18483-3-tzimmermann@suse.de>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <9a532541-9c5b-988c-b043-c7c3365aa49d@tronnes.org>
Date:   Wed, 13 Nov 2019 16:26:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191113115233.18483-3-tzimmermann@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org



Den 13.11.2019 12.52, skrev Thomas Zimmermann:
> There are no callers of drm_fb_helper_unlink_fbi() left. Remove the
> function.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>

