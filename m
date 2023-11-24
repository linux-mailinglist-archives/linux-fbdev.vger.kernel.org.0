Return-Path: <linux-fbdev+bounces-211-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AD87F77E8
	for <lists+linux-fbdev@lfdr.de>; Fri, 24 Nov 2023 16:34:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 704CE1C20D4C
	for <lists+linux-fbdev@lfdr.de>; Fri, 24 Nov 2023 15:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30EE52E852;
	Fri, 24 Nov 2023 15:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Mcl+cu8E"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 072B4D60;
	Fri, 24 Nov 2023 07:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=YH0n4Wp67DESQS2e3jluKHbDLDEmJ/9RueSoPQru0mg=; b=Mcl+cu8EtzZcCAyp4l+8EyWvvq
	Km2XkZNacDEvGshYY2eb1o17MK6Ta1/fk8dSNOtutDTnbnt2eXd9nqpCXFghpzbBpYGhBBt6ucUYI
	P+39PbdptmcAdnzk5ntKhM8LKBtTnup1jE5S07cnVlqNG+dm6Nist9JiexdXcECHTAWLeDDloEvA8
	VUB2rJjWkhJXTo4yMo5NdG9iiTWU+moYmdBhVwXsi4HvkCdZGFoaXamQ6Uv6E2ntLVNGkwHvJR86W
	wfIjAk2bYaGuQvbzghDYgDjY1NttEotiYreMmCFnP3FL+kp+AVWr6RjNbXu4BTFs+6FNHjBUEKwug
	0FTe2NUg==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1r6YCM-007Yhi-2R;
	Fri, 24 Nov 2023 15:34:30 +0000
Message-ID: <de706c0c-d6dc-45d4-a316-56ff56be5c25@infradead.org>
Date: Fri, 24 Nov 2023 07:34:28 -0800
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] video: fbdev: mmp: Fix typo in code comment
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Helge Deller <deller@gmx.de>,
 Zhou Zhu <zzhu3@marvell.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
References: <20231124095221.659445-1-dario.binacchi@amarulasolutions.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231124095221.659445-1-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/24/23 01:52, Dario Binacchi wrote:
> s/singals/signals/
> 
> Fixes: 641b4b1b6a7c ("video: mmpdisp: add spi port in display controller")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>  drivers/video/fbdev/mmp/hw/mmp_spi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/mmp/hw/mmp_spi.c b/drivers/video/fbdev/mmp/hw/mmp_spi.c
> index 16401eb95c6c..64e34b7e739e 100644
> --- a/drivers/video/fbdev/mmp/hw/mmp_spi.c
> +++ b/drivers/video/fbdev/mmp/hw/mmp_spi.c
> @@ -91,7 +91,7 @@ static int lcd_spi_setup(struct spi_device *spi)
>  	writel(tmp, reg_base + LCD_SPU_SPI_CTRL);
>  
>  	/*
> -	 * After set mode it need a time to pull up the spi singals,
> +	 * After set mode it need a time to pull up the spi signals,

Also:
	                  it needs time
or
	                  it needs some time

>  	 * or it would cause the wrong waveform when send spi command,
>  	 * especially on pxa910h
>  	 */

thanks.
-- 
~Randy

