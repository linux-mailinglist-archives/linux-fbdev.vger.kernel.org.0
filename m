Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CE402C6CDE
	for <lists+linux-fbdev@lfdr.de>; Fri, 27 Nov 2020 22:21:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729755AbgK0VSf (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 27 Nov 2020 16:18:35 -0500
Received: from smtprelay0058.hostedemail.com ([216.40.44.58]:52062 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730049AbgK0VRE (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 27 Nov 2020 16:17:04 -0500
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay06.hostedemail.com (Postfix) with ESMTP id 49B1E18225647;
        Fri, 27 Nov 2020 21:16:49 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:857:973:988:989:1260:1261:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3865:3867:3868:3872:4321:5007:6742:6743:7652:8879:10004:10400:10848:11026:11232:11657:11658:11914:12043:12048:12296:12297:12740:12895:13069:13311:13357:13439:13868:13894:14181:14659:14721:21080:21627:21740:21773:30054:30075:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:2,LUA_SUMMARY:none
X-HE-Tag: way41_430dcee2738b
X-Filterd-Recvd-Size: 3518
Received: from [10.0.0.26] (cpe-23-242-83-182.socal.res.rr.com [23.242.83.182])
        (Authenticated sender: joe@perches.com)
        by omf02.hostedemail.com (Postfix) with ESMTPA;
        Fri, 27 Nov 2020 21:16:43 +0000 (UTC)
Message-ID: <f8b2737702e295b9f780b98f27faac759ffff7ae.camel@perches.com>
Subject: Re: [PATCH v1 02/28] video: fbcon: Use pr_debug() in fbcon
From:   Joe Perches <joe@perches.com>
To:     Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
Cc:     Aditya Pakki <pakki001@umn.edu>,
        Alexander Klimov <grandmaster@al2klimov.de>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Antonino Daplas <adaplas@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Evgeny Novikov <novikov@ispras.ru>,
        Ferenc Bakonyi <fero@drama.obuda.kando.hu>,
        Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
        George Kennedy <george.kennedy@oracle.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Gustavo Silva <gustavoars@kernel.org>,
        Jani Nikula <jani.nikula@intel.com>,
        Jason Yan <yanaijie@huawei.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Kristoffer Ericson <kristoffer.ericson@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-nvidia@lists.surfsouth.com,
        Michal Januszewski <spock@gentoo.org>,
        Mike Rapoport <rppt@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Peilin Ye <yepeilin.cs@gmail.com>,
        Peter Rosin <peda@axentia.se>,
        Qilong Zhang <zhangqilong3@huawei.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
        Thomas Winischhofer <thomas@winischhofer.net>,
        Thomas Zimemrmann <tzimmermann@suse.de>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        Xiaofei Tan <tanxiaofei@huawei.com>
Date:   Fri, 27 Nov 2020 13:16:41 -0800
In-Reply-To: <20201127195825.858960-3-sam@ravnborg.org>
References: <20201127195825.858960-1-sam@ravnborg.org>
         <20201127195825.858960-3-sam@ravnborg.org>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, 2020-11-27 at 20:57 +0100, Sam Ravnborg wrote:
> Replacing DPRINTK() statements with pr_debug fixes
> W=1 warnings.
> And moves to a more standard logging setup at the same time.
[]
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
[]
> @@ -1015,9 +1007,9 @@ static const char *fbcon_startup(void)
>  	rows /= vc->vc_font.height;
>  	vc_resize(vc, cols, rows);
>  
> 
> -	DPRINTK("mode:   %s\n", info->fix.id);
> -	DPRINTK("visual: %d\n", info->fix.visual);
> -	DPRINTK("res:    %dx%d-%d\n", info->var.xres,
> +	pr_debug("mode:   %s\n", info->fix.id);
> +	pr_debug("visual: %d\n", info->fix.visual);
> +	pr_debug("res:    %dx%d-%d\n", info->var.xres,
>  		info->var.yres,
>  		info->var.bits_per_pixel);

It'd be nicer to reindent the subsequent lines too.

> @@ -3299,7 +3291,7 @@ static void fbcon_exit(void)
>  
> 
>  		if (info->queue.func)
>  			pending = cancel_work_sync(&info->queue);
> -		DPRINTK("fbcon: %s pending work\n", (pending ? "canceled" :
> +		pr_debug("fbcon: %s pending work\n", (pending ? "canceled" :
>  			"no"));

perhaps:

		pr_debug("fbcon: %s pending work\n", pending ? "canceled" : "no");


