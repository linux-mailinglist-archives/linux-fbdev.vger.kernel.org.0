Return-Path: <linux-fbdev+bounces-6615-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKG0D7HFt2kRVQEAu9opvQ
	(envelope-from <linux-fbdev+bounces-6615-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Mon, 16 Mar 2026 09:56:17 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C02296844
	for <lists+linux-fbdev@lfdr.de>; Mon, 16 Mar 2026 09:56:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B570301F9BB
	for <lists+linux-fbdev@lfdr.de>; Mon, 16 Mar 2026 08:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4B93382364;
	Mon, 16 Mar 2026 08:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v7nSbt7q"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30E6381AEF
	for <linux-fbdev@vger.kernel.org>; Mon, 16 Mar 2026 08:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773651366; cv=none; b=bibF9xSgPQ2WEMgf1s667W8b2F5ZR5a50YEqDe46npGODpMuS1LkYOoZJuEQkRdOcsWgyKEiefXPH2XADQ2+/U89Z+N7FfmcHDPhcFucEkAlMLd6a+MuR9BIEqv/qxt+hmjiMtBD1014Z3JyqasCjK3FnhQHjF4V9M7LpIVdQnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773651366; c=relaxed/simple;
	bh=eABlA2VDKd3+5VX2KjIEWTpjrYdlhep34hzJgLFMIQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gFMImdvbpl6CN5/zU+HZcYFZhS9jnfY5NRpfgJFzswieEIvTkQgykoB/02gAt2K9voCYDU/vqYjRXb/rC8YdtFHmCJ9FOMidQ91dE3xJj5emLhKCyZkIhn6gIqKHsy6Y32VHZN4jJHyVLgw9CqYUOUHMS9owh3bVEJRX1oPVuBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v7nSbt7q; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48557c8ad47so23432275e9.0
        for <linux-fbdev@vger.kernel.org>; Mon, 16 Mar 2026 01:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773651363; x=1774256163; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ElOuVFXFpDm6rPhqYIQli2UADT/0TqiBL46FFSx3R8I=;
        b=v7nSbt7q+colGqm/jChX166IjWgV4HzTD7dMQi5Pjuhp25bePbMeclmMMbZcBkFNcS
         MuiZUrKBXls+LRnWgG8QmGwhLAXOMYFoh12/TO2/4fMWve/R48y6mzOUL6y/GuoqtVcS
         OvJYVKF+lNxd99eDcGn44MLzXrIqrb87UiX2q4eA0R6AJYUK/Y/tkd2jggrUIKDGDAqs
         psZNSNXJ3uaIZ7RWGazL/wM6aCbTvXiXPR6FEfMQhrOu5tYmBON2XZAqneIDAr37iCzd
         Io4Jl7QMMmsMgNv6iTqkxdadRJIcioc2ejzeSXNB4k9Ks8MOet2A0fBuPY2fyjImSKT1
         KAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773651363; x=1774256163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ElOuVFXFpDm6rPhqYIQli2UADT/0TqiBL46FFSx3R8I=;
        b=Kf33aMIVoaVY68YhLB2dz/yEbdHx5JsM/B7Q/5QN2EmjnOv9xp8TqstDdvJeU0TWLl
         Nn5xknvQwcOpjF3SLtWmzAchBDbMZCeiIZt0HVfg94orCVlOj470LBHx5WaxDpLvwovP
         H9wlZFi2dqxDhV26wDDNpWo3GtcS2+e+ZxiOUwo//D6WkC2XMDtAyLJrb4yfJlV7hdyh
         /marvP2UBC3WSJ2dCEwmMQJ3QFOR6adt1Mte+sLL99fQYNnklmG/Rg7h17ebOqEmBpw/
         o4TLBecCdGRWLB+8f5mhlfKWhW4Dy8t+qphSRHkSGz52u0EfzlMLiy9BKBbNYtXRh7T/
         gV/Q==
X-Forwarded-Encrypted: i=1; AJvYcCW6eUnx2t6qJqhqqkSerJF7tzv4gBfJkeJp2SJLcSdrJ9wggXKNC42DqjGa2JYLujFTUaMl5vyzMnx/HQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvECSLtZti6FMxeTpZJ+CI/gi9keft/j/BEu0Sisd9GG9ihBB9
	1F8esIpeigDmlxQGeqXoJthGXtlM83fgHSNwhcpenQTXojlRR2V6aW3eTmNzdiBcLto=
X-Gm-Gg: ATEYQzy6Kw2KO2pu/VmjwuXGeB4YamlJa86p2jiRHoc35MkA+XaPJvkumKNSWX1O6qH
	9lPOZhUYwl0Bp8NGF8NftzIQgRRVJqXs6g0anjAPFF+psLEJiRQ/i+KjDxVCn0YXkUIcVu9JTDt
	ROaf03RbTfBNEcGsZarMUTWyWJsq6CmIw1VQEYTkB1jaZmktvUuQzVFXL3zKgAOQ0Sz9jnSrCs2
	Zfb3Zh0OHK0/cTn7Sa8u4SzHfcdX/JWQ0K/H60IPq1C5dVLDJPJK3qJeTj32R77jf7j9Y+JshkN
	2zeSUTMth404qKYlDmTy/2pAckFcdZHOskQ+0GEA9e4r3WS3VkX38jC0oO3uJHt/ZTRXKuz5DLN
	2dLvYs4xpUNtXiVCwzADS/m3i+0du3pptdgGCqeKygdG7oAIbGoBy9lPIjWLMbeFouAQZwxis0o
	3riM+PVwvvpegCgOupP9UPSVTYJoTE
X-Received: by 2002:a05:600c:8b6f:b0:485:550c:cda4 with SMTP id 5b1f17b1804b1-485566d9318mr194216815e9.8.1773651363073;
        Mon, 16 Mar 2026 01:56:03 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4855778eda8sm138525295e9.5.2026.03.16.01.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 01:56:02 -0700 (PDT)
Date: Mon, 16 Mar 2026 11:55:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: OaroraEtimis <oaroraetimis@gmail.com>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: Replace busy-wait loop with udelay()
Message-ID: <abfFn_AET_xAVjji@stanley.mountain>
References: <20260315150532.87280-1-OaroraEtimis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260315150532.87280-1-OaroraEtimis@gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6615-lists,linux-fbdev=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,siliconmotion.com,linuxfoundation.org,vger.kernel.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-fbdev@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-fbdev];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,stanley.mountain:mid]
X-Rspamd-Queue-Id: B9C02296844
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sudip,

What the status on a replacement for the sm750fb driver?

On Sun, Mar 15, 2026 at 11:05:32PM +0800, OaroraEtimis wrote:
> The empty for-loop in sw_i2c_wait() triggers a -Wunused-but-set-variable
> warning and can be optimized away by modern compilers.
> 
> Fix this by replacing the unreliable loop with a standard udelay(2).
> This also cleans up the unused 'tmp' variable and outdated comments.
> Include <linux/delay.h> to resolve the implicit function declaration.
> 
> Signed-off-by: OaroraEtimis <OaroraEtimis@gmail.com>
> ---
>  drivers/staging/sm750fb/ddk750_swi2c.c | 20 ++------------------
>  1 file changed, 2 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/staging/sm750fb/ddk750_swi2c.c b/drivers/staging/sm750fb/ddk750_swi2c.c
> index 0ef8d4ff2ef9..d0aeb917be92 100644
> --- a/drivers/staging/sm750fb/ddk750_swi2c.c
> +++ b/drivers/staging/sm750fb/ddk750_swi2c.c
> @@ -11,6 +11,7 @@
>  #include "ddk750_reg.h"
>  #include "ddk750_swi2c.h"
>  #include "ddk750_power.h"
> +#include <linux/delay.h>
>  
>  /*
>   * I2C Software Master Driver:
> @@ -80,24 +81,7 @@ static unsigned long sw_i2c_data_gpio_data_dir_reg = GPIO_DATA_DIRECTION;
>   */
>  static void sw_i2c_wait(void)
>  {
> -	/* find a bug:
> -	 * peekIO method works well before suspend/resume
> -	 * but after suspend, peekIO(0x3ce,0x61) & 0x10
> -	 * always be non-zero,which makes the while loop
> -	 * never finish.
> -	 * use non-ultimate for loop below is safe
> -	 */
> -
> -    /* Change wait algorithm to use PCI bus clock,
> -     * it's more reliable than counter loop ..
> -     * write 0x61 to 0x3ce and read from 0x3cf
> -     */
> -	int i, tmp;
> -
> -	for (i = 0; i < 600; i++) {
> -		tmp = i;
> -		tmp += i;
> -	}
> +	udelay(2);

What an interesting thing...  This function has always been nonsense
since it was first merged.  The comment talks about the old code which
did:

	while (peekIO(0x3ce, 0x61) & 0x10)
		;

Which apparently "works well" except that after suspend it becomes
a forever loop so instead of that they have this bonkers "count to 600"
loop.

Your patch looks reasonable, but generally we don't merge that sort
of patch without anyone to test it.  The problem with merging your code
is that it looks so reasonable, that people might assume it's correct.
Meanwhile if we just leave it as-is, everyone can see it's totally buggy
so when people report bugs we'll know exactly where to look.

Sudip was working on a replacement for this driver.  Let's ask him for
advice.

regards,
dan carpenter


