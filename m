Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC5C225DC43
	for <lists+linux-fbdev@lfdr.de>; Fri,  4 Sep 2020 16:53:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730487AbgIDOx2 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 4 Sep 2020 10:53:28 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:58700 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730297AbgIDOx1 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Fri, 4 Sep 2020 10:53:27 -0400
Received: from fsav110.sakura.ne.jp (fsav110.sakura.ne.jp [27.133.134.237])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 084ErJOu003314;
        Fri, 4 Sep 2020 23:53:19 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav110.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav110.sakura.ne.jp);
 Fri, 04 Sep 2020 23:53:19 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav110.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 084ErIRe003301
        (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
        Fri, 4 Sep 2020 23:53:19 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH v2 (resend)] video: fbdev: fix OOB read in
 vga_8planes_imageblit()
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        DRI <dri-devel@lists.freedesktop.org>
References: <11ad8786-e407-3289-8bd9-2745c4834718@i-love.sakura.ne.jp>
 <90b55ec3-d5b0-3307-9f7c-7ff5c5fd6ad3@i-love.sakura.ne.jp>
Message-ID: <36618e37-2cb6-8114-7a43-788780fae321@i-love.sakura.ne.jp>
Date:   Fri, 4 Sep 2020 23:53:16 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <90b55ec3-d5b0-3307-9f7c-7ff5c5fd6ad3@i-love.sakura.ne.jp>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hello, Greg.

Since nobody is interested in this bug, can you directly pick up
this obvious patch without waiting for maintainer's response?

On 2020/08/31 19:37, Tetsuo Handa wrote:
> syzbot is reporting OOB read at vga_8planes_imageblit() [1], for
> "cdat[y] >> 4" can become a negative value due to "const char *cdat".
> 
> [1] https://syzkaller.appspot.com/bug?id=0d7a0da1557dcd1989e00cb3692b26d4173b4132
> 
> Reported-by: syzbot <syzbot+69fbd3e01470f169c8c4@syzkaller.appspotmail.com>
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> ---
>  drivers/video/fbdev/vga16fb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16fb.c
> index a20eeb8308ff..578d3541e3d6 100644
> --- a/drivers/video/fbdev/vga16fb.c
> +++ b/drivers/video/fbdev/vga16fb.c
> @@ -1121,7 +1121,7 @@ static void vga_8planes_imageblit(struct fb_info *info, const struct fb_image *i
>          char oldop = setop(0);
>          char oldsr = setsr(0);
>          char oldmask = selectmask();
> -        const char *cdat = image->data;
> +	const unsigned char *cdat = image->data;
>  	u32 dx = image->dx;
>          char __iomem *where;
>          int y;
> 

