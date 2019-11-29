Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9ACA810D6B7
	for <lists+linux-fbdev@lfdr.de>; Fri, 29 Nov 2019 15:12:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726824AbfK2OMN (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 29 Nov 2019 09:12:13 -0500
Received: from smtp.domeneshop.no ([194.63.252.55]:60727 "EHLO
        smtp.domeneshop.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726878AbfK2OMN (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 29 Nov 2019 09:12:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds201810; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=mCOMn0jrLhbugFa3zJRR2tiZlWvauRU6XzY33ntGSlM=; b=Rb+LNaqGByG5T1nIeu0bhgL+1G
        ijwGWqsa+GOdhNYG6ddgMBpmLYJumKDygTiPMDIgKp+XWbJdwuFQ2YFQDjVzqpm0HYq/A2qmfiXJV
        GEYB++IYytbrlaUYfQuhirAXZANtB/6gvjrmj/yygnyKi5W3VfWYfbzHKSULtGBSSsDjeepBRrKX+
        nyREtr+mrpDMV9Uy5VzP7yCnLSCP/suWtBfD7UGrgAmorX0+2//e8FdcSdEn3ZLElBqjugsLP9fAI
        pv2pp5EqZhtbmqrLrbLv16Htam7yc+XTE8RP/xeWMsmwKQuGHLTRRI1U8/vlqOtChG7oZSvI0cKkN
        jDL6WUCw==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:64570 helo=[192.168.10.174])
        by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1iah0E-0002OJ-P7; Fri, 29 Nov 2019 15:12:10 +0100
Subject: Re: [PATCH v2 01/14] video: fb_defio: preserve user fb_ops
To:     Jani Nikula <jani.nikula@intel.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Cc:     intel-gfx@lists.freedesktop.org
References: <cover.1575022735.git.jani.nikula@intel.com>
 <022c82429da15d6450ff9ac1a897322ec3124db4.1575022735.git.jani.nikula@intel.com>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <b9c25f8d-c1e4-3c72-c6ed-903015a69e63@tronnes.org>
Date:   Fri, 29 Nov 2019 15:12:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <022c82429da15d6450ff9ac1a897322ec3124db4.1575022735.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org



Den 29.11.2019 11.29, skrev Jani Nikula:
> Modifying fb_ops directly to override fb_mmap with fb_deferred_io_mmap
> and then resetting it to NULL afterwards causes problems all over the
> place. First, it prevents making the fbops member of struct fb_info a
> const pointer, which means we can't make struct fb_ops const
> anywhere. Second, a few places have to go out of their way to restore
> the original fb_mmap pointer that gets reset to NULL.
> 
> Since the only user of the fbops->fb_mmap hook is fb_mmap() in fbmem.c,
> call fb_deferred_io_mmap() directly when deferred IO is enabled, and
> avoid modifying fb_ops altogether.
> 
> Simply use info->fbdefio to determine whether deferred IO should be used
> or not. This should be accurate enough for all use cases, although
> perhaps not pedantically correct.
> 
> v2: Simplify considerably by calling fb_deferred_io_mmap() directly
>     (Daniel, Ville)
> 
> Cc: Jaya Kumar <jayalk@intworks.biz>
> Cc: linux-fbdev@vger.kernel.org
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---

Nice simple solution:

Acked-by: Noralf Trønnes <noralf@tronnes.org>
