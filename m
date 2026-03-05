Return-Path: <linux-fbdev+bounces-6491-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id BuhANRzNqGngxQAAu9opvQ
	(envelope-from <linux-fbdev+bounces-6491-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Thu, 05 Mar 2026 01:23:56 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 44728209659
	for <lists+linux-fbdev@lfdr.de>; Thu, 05 Mar 2026 01:23:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B8E4F303AF32
	for <lists+linux-fbdev@lfdr.de>; Thu,  5 Mar 2026 00:23:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC1F01C8604;
	Thu,  5 Mar 2026 00:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oU0MDVBS"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80DA1C6FF5;
	Thu,  5 Mar 2026 00:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772670231; cv=none; b=g+q8RZew8R0dwIB15u9is1IEaSOMZbRocyzrgMcS8ymL240RbkWBaBIVnETABtUDumSchTsrj4rA9oMbwvRT6XqASe/nAWUponowv6g3a/auWFboQj9G0XPOWzNITDvCOxy7NrMBPV6SVFmrCpt5fqQpcocPNJXqzzH35E4KMW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772670231; c=relaxed/simple;
	bh=y7DfFca5BwGLTdsV10+azoOM3Jmj6MnCcT9JsOiC4js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B2THULhwjSM2CMQ5tTxrJRbjXmFqlmefBdm2rLxJW2vwhTnZfW8sbDGIRKD+fTmCDtEj7HkpENkqpvfMudMy1uVwKT0RfzKkKxL66TplZbxe5hH1MsB9ldg+anL2sq7ukLCerjpDVtmP4Vx1J3iA0LaV24yY9o6ZQ1jPhH7DotA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oU0MDVBS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9B16C4CEF7;
	Thu,  5 Mar 2026 00:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772670231;
	bh=y7DfFca5BwGLTdsV10+azoOM3Jmj6MnCcT9JsOiC4js=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oU0MDVBSFI40hoL7TuiPn7pRpKDvN63IIns4tlIhDrF9471f+FD79YkOi41y/su8m
	 tUZlLFvbRgnE0cfuOGSF5H2p8UwmLqSgKECfjnaVNXbPWVjP3nfmNnJQO0ZrKQbG5V
	 ke+/XMBUtwVAVljl3jMEDfy+3WxWhM8aAJ5PuSBM+lI7d2xCmwFQIeMDtMh8ouwWHO
	 l74M5rJUFIecGnt3iKpDwvRS+iG1lWW1jy6nCGw5eRmH2TcCl+So6R52OtyQFwIqoR
	 krK1doizo4rk/803pysVogqTWxsdU6BQ/IXbd0PzKnw4QzRHCEAYuIXqIMCTf+w8Dr
	 qgALiewXsskkg==
Date: Wed, 4 Mar 2026 17:23:47 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: gregkh@linuxfoundation.org, deller@gmx.de, sam@ravnborg.org,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/13] lib/fonts: Compare font data for equality with
 font_data_is_equal()
Message-ID: <20260305002347.GA4102761@ax162>
References: <20260302141255.518657-1-tzimmermann@suse.de>
 <20260302141255.518657-10-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302141255.518657-10-tzimmermann@suse.de>
X-Rspamd-Queue-Id: 44728209659
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,gmx.de,ravnborg.org,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-6491-lists,linux-fbdev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-fbdev@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Thomas,

On Mon, Mar 02, 2026 at 03:08:43PM +0100, Thomas Zimmermann wrote:
...
> diff --git a/lib/fonts/fonts.c b/lib/fonts/fonts.c
> index 8c9a6762061c..c9f6328d5dda 100644
> --- a/lib/fonts/fonts.c
> +++ b/lib/fonts/fonts.c
> @@ -12,18 +12,25 @@
>   * for more details.
>   */
>  
> +#include <linux/font.h>
>  #include <linux/module.h>
> -#include <linux/types.h>
>  #include <linux/string.h>
> +#include <linux/types.h>
> +
> +#include <asm/sections.h>
>  #if defined(__mc68000__)
>  #include <asm/setup.h>
>  #endif
> -#include <linux/font.h>
>  
>  /*
>   * Helpers for font_data_t
>   */
>  
> +static bool font_data_is_internal(font_data_t *fd)
> +{
> +	return is_kernel_rodata((unsigned long)fd);
> +}
> +
>  /**
>   * font_data_size - Return size of the font data in bytes
>   * @fd: Font data
> @@ -37,6 +44,32 @@ unsigned int font_data_size(font_data_t *fd)
>  }
>  EXPORT_SYMBOL_GPL(font_data_size);
>  
> +/**
> + * font_data_is_equal - Compares font data for equality
> + * @lhs: Left-hand side font data
> + * @rhs: Right-hand-size font data
> + *
> + * Font data is equal if is constain the same sequence of values. The
> + * helper also use the checksum, if both arguments contain it. Font data
> + * coming from different origins, internal or from user space, is never
> + * equal. Allowing this would break reference counting.
> + *
> + * Returns:
> + * True if the given font data is equal, false otherwise.
> + */
> +bool font_data_is_equal(font_data_t *lhs, font_data_t *rhs)
> +{
> +	if (font_data_is_internal(lhs) != font_data_is_internal(rhs))
> +		return false;

This breaks the build when CONFIG_FONT_SUPPORT is a module.

  $ cat allno.config
  CONFIG_MODULES=y
  CONFIG_DRM=m
  CONFIG_DRM_PANIC=y

  $ make -skj"$(nproc)" ARCH=x86_64 CROSS_COMPILE=x86_64-linux- KCONFIG_ALLCONFIG=1 allnoconfig all
  ERROR: modpost: "__end_rodata" [lib/fonts/font.ko] undefined!
  make[4]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1
  ...

  $ scripts/config -s FONT_SUPPORT
  m

Cheers,
Nathan

> +	if (font_data_size(lhs) != font_data_size(rhs))
> +		return false;
> +	if (FNTSUM(lhs) && FNTSUM(rhs) && FNTSUM(lhs) != FNTSUM(rhs))
> +		return false;
> +
> +	return !memcmp(lhs, rhs, FNTSIZE(lhs));
> +}
> +EXPORT_SYMBOL_GPL(font_data_is_equal);
> +
>  /*
>   * Font lookup
>   */
> -- 
> 2.53.0
> 

