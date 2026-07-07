Return-Path: <linux-fbdev+bounces-7867-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wWO/GsfcTGphrAEAu9opvQ
	(envelope-from <linux-fbdev+bounces-7867-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 07 Jul 2026 13:02:31 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FB571AB94
	for <lists+linux-fbdev@lfdr.de>; Tue, 07 Jul 2026 13:02:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=tBh2z1PM;
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7867-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7867-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3CE9430E7F31
	for <lists+linux-fbdev@lfdr.de>; Tue,  7 Jul 2026 10:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 973F53EFFC3;
	Tue,  7 Jul 2026 10:56:45 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2393B6C0A;
	Tue,  7 Jul 2026 10:56:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783421805; cv=none; b=QGknXtWaRQpXpZs4bxpqgOo+UMBifGcXZ1hatmSwxHzpdhy2dlvPEa5+Iw/dkSD1OXl+xJ62gfxFk7JZvMmrw8eCo+fpT6djHtyZIklwGami5D5THwWr2k7SC9T8XCpBghcwidt/RlzXikcGa3cZD7jwgEGK0l1EPSkE+2N0vrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783421805; c=relaxed/simple;
	bh=NDd0LmtCWAyL+0oZu+U7r4MGzfpcgasxxmH/X9uVS0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PuBZySp9zAd1IVQwZuooQ22YHaH2SZg3R4Wcc+tM837KvgAMlMWNVlKwwDsHnaR9pm2lcylASRpe5rXcLelngH48XiU+XoM9I8GLbqducjIfP3JAmIxJ67z2+GfGb7NtFQ8EOvhH0Y6iL4xjZkgoVFhyi48UiyKy/mYLMdXz5VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tBh2z1PM; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D7251F000E9;
	Tue,  7 Jul 2026 10:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783421803;
	bh=Q1sHvt8vnyiY6d6eFXBMXQR3LSRCo9iSC2dih3vsexQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=tBh2z1PMN4RS2qKf/4Z6T3Xlfth2A2bMsWni43/MA3SMSjHlqFKsh1K+5aaqf8G3a
	 uzdXSJBHCb1VsDgtPG38YBRAeZ3TiZyJfi+isBLzJy+KDCqBwI+7GgiNJNPqFsWvzU
	 1opAZ3+pYA/bQwuMm2HQanLpaAR5k1SLO/TPhbfU=
Date: Tue, 7 Jul 2026 12:56:41 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?Andr=E9?= Moreira <andrem.33333@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: sm750fb: rename variables to comply with
 kernel style
Message-ID: <2026070730-womanlike-pluck-650f@gregkh>
References: <2026070710-exact-unveiling-e321@gregkh>
 <20260707102749.15163-1-andrem.33333@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707102749.15163-1-andrem.33333@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrem.33333@gmail.com,m:sudipm.mukherjee@gmail.com,m:teddy.wang@siliconmotion.com,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:andrem33333@gmail.com,m:sudipmmukherjee@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,linux-fbdev@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-7867-lists,linux-fbdev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-fbdev@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,siliconmotion.com,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linuxfoundation.org:from_mime,linuxfoundation.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B8FB571AB94

On Tue, Jul 07, 2026 at 07:27:48AM -0300, André Moreira wrote:
> Rename 'pvReg' to 'regs' to remove Hungarian notation, and rename
> 'setAllEngOff' to 'set_all_eng_off' to avoid CamelCase throughout
> the driver. This complies with the Linux kernel coding style.
> 
> Signed-off-by: André Moreira <andrem.33333@gmail.com>
> ---
>  drivers/staging/sm750fb/sm750.c    |  6 +++---
>  drivers/staging/sm750fb/sm750.h    |  4 ++--
>  drivers/staging/sm750fb/sm750_hw.c | 12 ++++++------
>  3 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
> index 89c811e0806c4..7cd9cb0b3498c 100644
> --- a/drivers/staging/sm750fb/sm750.c
> +++ b/drivers/staging/sm750fb/sm750.c
> @@ -743,7 +743,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
>  	 * must be set after crtc member initialized
>  	 */
>  	crtc->cursor.offset = crtc->o_screen + crtc->vidmem_size - 1024;
> -	crtc->cursor.mmio = sm750_dev->pvReg +
> +	crtc->cursor.mmio = sm750_dev->regs +
>  		0x800f0 + (int)crtc->channel * 0x140;
>  
>  	crtc->cursor.max_h = 64;
> @@ -848,7 +848,7 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
>  	sm750_dev->init_parm.mem_clk = 0;
>  	sm750_dev->init_parm.master_clk = 0;
>  	sm750_dev->init_parm.power_mode = 0;
> -	sm750_dev->init_parm.setAllEngOff = 0;
> +	sm750_dev->init_parm.set_all_eng_off = 0;
>  	sm750_dev->init_parm.reset_memory = 1;
>  
>  	/* defaultly turn g_hwcursor on for both view */
> @@ -1047,7 +1047,7 @@ static void lynxfb_pci_remove(struct pci_dev *pdev)
>  	sm750fb_framebuffer_release(sm750_dev);
>  	arch_phys_wc_del(sm750_dev->mtrr.vram);
>  
> -	iounmap(sm750_dev->pvReg);
> +	iounmap(sm750_dev->regs);
>  	iounmap(sm750_dev->vmem);
>  	pci_release_region(pdev, 1);
>  	kfree(g_settings);
> diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
> index d2c522e67f26a..32f9a9ac7be73 100644
> --- a/drivers/staging/sm750fb/sm750.h
> +++ b/drivers/staging/sm750fb/sm750.h
> @@ -44,7 +44,7 @@ struct init_status {
>  	ushort chip_clk;
>  	ushort mem_clk;
>  	ushort master_clk;
> -	ushort setAllEngOff;
> +	ushort set_all_eng_off;
>  	ushort reset_memory;
>  };
>  
> @@ -97,7 +97,7 @@ struct sm750_dev {
>  	unsigned long vidreg_start;
>  	__u32 vidmem_size;
>  	__u32 vidreg_size;
> -	void __iomem *pvReg;
> +	void __iomem *regs;
>  	unsigned char __iomem *vmem;
>  	/* locks*/
>  	spinlock_t slock;
> diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
> index 34a837fb4b649..c5a495bb5ac57 100644
> --- a/drivers/staging/sm750fb/sm750_hw.c
> +++ b/drivers/staging/sm750fb/sm750_hw.c
> @@ -23,18 +23,18 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
>  	}
>  
>  	/* now map mmio and vidmem */
> -	sm750_dev->pvReg =
> +	sm750_dev->regs =
>  		ioremap(sm750_dev->vidreg_start, sm750_dev->vidreg_size);
> -	if (!sm750_dev->pvReg) {
> +	if (!sm750_dev->regs) {
>  		dev_err(&pdev->dev, "mmio failed\n");
>  		ret = -EFAULT;
>  		goto err_release_region;
>  	}
>  
> -	sm750_dev->accel.dpr_base = sm750_dev->pvReg + DE_BASE_ADDR_TYPE1;
> -	sm750_dev->accel.dp_port_base = sm750_dev->pvReg + DE_PORT_ADDR_TYPE1;
> +	sm750_dev->accel.dpr_base = sm750_dev->regs + DE_BASE_ADDR_TYPE1;
> +	sm750_dev->accel.dp_port_base = sm750_dev->regs + DE_PORT_ADDR_TYPE1;
>  
> -	mmio750 = sm750_dev->pvReg;
> +	mmio750 = sm750_dev->regs;
>  	sm750_set_chip_type(sm750_dev->devid, sm750_dev->revid);
>  
>  	sm750_dev->vidmem_start = pci_resource_start(pdev, 0);
> @@ -58,7 +58,7 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
>  	return 0;
>  
>  err_unmap_reg:
> -	iounmap(sm750_dev->pvReg);
> +	iounmap(sm750_dev->regs);
>  err_release_region:
>  	pci_release_region(pdev, 1);
>  	return ret;
> -- 
> 2.43.0
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

