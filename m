Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35E2B185AF4
	for <lists+linux-fbdev@lfdr.de>; Sun, 15 Mar 2020 08:17:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727670AbgCOHPq (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 15 Mar 2020 03:15:46 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:49192 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727798AbgCOHPg (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sun, 15 Mar 2020 03:15:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:To:From:
        Subject:Sender:Reply-To:Cc:Content-ID:Content-Description;
        bh=PIdL3ADHFqOYxL3rUUU7O33jeUO949ynfok0fGxMJ30=; b=aOT8m7qknOR/gn204boJiMs3mh
        eT5ZkX9U6rLnc4HmFFQg8Z7wI6k7PW5yJwtqEbx60/O86SSRqHaXftTwclz4jAbKCXU4o3IwuA+XQ
        BkDtoAJQJAAHVUKDoscctGsMXS/X7FgW+Z3uMMDDu4nncTMkgPmbI3CcolDQ5vn3gumpr7hPJRFI5
        B1WycobIxdcrYJAIOu8H2+qIWmyvVI2is9SuCCCh1FjVA1cbRgeYPCpxVeo1zF/g7FRDMFE69NqmH
        kVtp7q+QFOFkMrGDwgyVs/GHnOUJHXnHPClyEz3h5BIvNSWW5j17pqYlZR8cJWuzx7Ze4EaG1IJ8d
        Kxj0uuOQ==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jDAmc-0005IX-80; Sat, 14 Mar 2020 17:41:10 +0000
Subject: Re: pm3fb.c: question
From:   Randy Dunlap <rdunlap@infradead.org>
To:     Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <9f7b3b9b-f48e-6da1-d08c-cc60f60b1eac@infradead.org>
Message-ID: <044a63f0-2589-5550-572e-df57c7135c31@infradead.org>
Date:   Sat, 14 Mar 2020 10:41:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <9f7b3b9b-f48e-6da1-d08c-cc60f60b1eac@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 3/14/20 12:35 AM, Randy Dunlap wrote:
> In drivers/video/fbdev/pm3fb.c, if I change the definition of DPRINTK()
> (in order to remove some gcc warnings if -Wextra is used), like this:
> 
> -#define DPRINTK(a, b...)
> +#define DPRINTK(a, b...)	no_printk(a, ##b)
> 
> I get a build error here:
> 		default:
> 			DPRINTK("Unsupported depth %d\n",
> 				info->current_par->depth);
> 			break;
> 
> ../drivers/video/fbdev/pm3fb.c: In function ‘pm3fb_init_engine’:
> ../drivers/video/fbdev/pm3fb.c:353:9: error: ‘struct fb_info’ has no member named ‘current_par’
>      info->current_par->depth);
>          ^
> 
> Is there a replacement (fix) for this field?
> or should the entire DPRINTK() be deleted?
> or somethine else?

Got it.
I'll just change it to what is used in the switch statement above.

-- 
~Randy

