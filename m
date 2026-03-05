Return-Path: <linux-fbdev+bounces-6492-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QA/LK8AVqWnR1QAAu9opvQ
	(envelope-from <linux-fbdev+bounces-6492-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Thu, 05 Mar 2026 06:33:52 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E2E20B03C
	for <lists+linux-fbdev@lfdr.de>; Thu, 05 Mar 2026 06:33:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 096B0301B71F
	for <lists+linux-fbdev@lfdr.de>; Thu,  5 Mar 2026 05:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C792246781;
	Thu,  5 Mar 2026 05:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V7VLctsw"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0013F1E5018
	for <linux-fbdev@vger.kernel.org>; Thu,  5 Mar 2026 05:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772688829; cv=none; b=uTfXmVQKs2eBQvBR6uULFL9Q4KLs9nVjhV4POZyx6hPfS8pAHzF642GrhHSZOIzC1Ji7Lal/jykZMMbd2PChoIqVl1MpvFLvxONgIMHGBUdx6tzkN6BBrkq0fO/DZ1GIfB6lhXXwEEDUCs0GGjGk4VXJ1N3VFdT3PDIZnaWfQPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772688829; c=relaxed/simple;
	bh=wj6XVJR7daBU7N60b0ABVb/8u/aeymIukhxPfV3iPe0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=irme+QLGtSN0kFtTsOGzsBose2bYGIB+QNa9v5qAC7r3Aw53Eb6pS8H7xAVg0ugXPuIJhm1aQO6jnHzTwad2NHRz5rBndiMfPBH5TLlxjOYJV0Cyl+epARFzAt2WXNpySLynuWwETm8xzWo5jtD45T7W76IMgvT2YgpCpPDsrIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V7VLctsw; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439aa2f8ebaso2976179f8f.2
        for <linux-fbdev@vger.kernel.org>; Wed, 04 Mar 2026 21:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772688826; x=1773293626; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fhxvhu2T/q45ENXvH+eUJLMEREATBu6EpqQKx+HGiRE=;
        b=V7VLctsw07sgyiUo/+n02NUkyj+Pi7wucaxCrYD0Jyimgwj9OyCQ+/7q+crIFA0OhM
         IwAKEC5NWyV3Fvp1Jrf3NMvamLy7/pAZj+3VUvT3ovV1X0gOLM1QRToMxhGtEEFPZQiF
         e513tUXLUdKvdYQV40n9KfhnooIzRmLlvHZo+pfnxeJtepWRQnJJQofZj8sMpmaYs598
         Qn5dJiKdOWKisaGC+UTfU5ilRZ8UlEnO1CfPVCONP5CyX1oNE/xfTQHYQIq+CbkQ0XsW
         eWbK4UB8kkGrJPLfD+o5e5ADijhqLLWwvR9V5qOXnvHxUVCi+VMCV+apr9l4g2pf56nl
         /4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772688826; x=1773293626;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fhxvhu2T/q45ENXvH+eUJLMEREATBu6EpqQKx+HGiRE=;
        b=B/6y0Mihq64bPUAXMpjdlScbfTyis8ifvndUAmc0ZNZ40Df4JoXaZERTReMY4cROft
         eJdeFGabGxoWRTNT9Tsdbik2/M/lG1AB3KzNNtuXmGlrzoOPv1h2yZAs3KmxafTiQVGP
         96vJhcrrDVGAJs9DGQDI8a3SDgcLMQG5IpcvE9UvvVBo7ZrHrT0wSItDXTPXNiNYbG9+
         wEwqgUtVSxfpUiBIeH4N35MHqn0bj7w8/LMpjbls79jTDwFDZLSbvhegNMhPxI/hmTev
         /DaMIWXbaYk/WuUq3jqRSD4Az0tkgU5pBc6Y39oBiJXZopzzZ3+igDLopTaET+tQN7AW
         tw8g==
X-Forwarded-Encrypted: i=1; AJvYcCXlWFsStZQGh7SFGCBbZJaX8WHHMVSxrd6yguekIMC/KMiUSlhxsAv1VIvsljOL+1vn6N1bGAvqBO/A2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFKm/Fqkz72omOLZCyTY93gdFUG8/jB16o/X1LML8mCW5M77nd
	C0EQcB9G1XAOqO0LbEkWbvnRGEzlmDkV4feAOMzH074uNxaElfKNVzSybotClIshRcU=
X-Gm-Gg: ATEYQzwEOwB2Xpm8A1tKoPoRf+F4DINHHRUxAxB4gj39i1ESyf203uHbw20yZW+T/vU
	j79tcWAJmna5OY3TR/IiFTFtz6dxcvDuqeHDUXPGoHt+4OiBYkHu9UXzRgiy05yxF/rWuvHLw7n
	F1EhwBO3APdQuPfnqoulBB8ZbJ1y7HRpTT8XADNUF5wY0GuJsPGuhuK+fFzRIVaWB0J+/U30KgH
	Gqi4GK/FtM8VUysoWN+/4i/WW8Cnce/O7NX0zPgfSPQebqPdG/POqfv0Jp6F8603qrhe22jVFJx
	UxSw3fq8eH85XuqeBdmKqqdRg/foFT3t1UEGthWk5ejp3+CgXTLoDYTMnx4Vl+R4iV/yD95025J
	yxdOVZwSoZCgkQwOPEa+kxdvdBM2zTkBLi/WsJLMso5c3UKQlth997cJDOOG31KQAs6/dpG1AKX
	qL22oKYX+j255h1GrDLKdhJBjPgXQw
X-Received: by 2002:a05:6000:2401:b0:439:ad72:9900 with SMTP id ffacd0b85a97d-439c7fffc62mr7932444f8f.29.1772688826250;
        Wed, 04 Mar 2026 21:33:46 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439af926c53sm40217958f8f.8.2026.03.04.21.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 21:33:45 -0800 (PST)
Date: Thu, 5 Mar 2026 08:33:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Soham Kute <officialsohamkute@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] staging: sm750fb: hw_sm750le_de_wait: return
 -ETIMEDOUT on timeout
Message-ID: <aakVticYA5tHisbr@stanley.mountain>
References: <aaVT1mSeKrSSlrha@stanley.mountain>
 <20260304173529.192067-1-officialsohamkute@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304173529.192067-1-officialsohamkute@gmail.com>
X-Rspamd-Queue-Id: 36E2E20B03C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,siliconmotion.com,linuxfoundation.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-6492-lists,linux-fbdev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[linaro.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-fbdev@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-fbdev];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 11:05:24PM +0530, Soham Kute wrote:
> Return -ETIMEDOUT instead of -1 when the DE engine poll loop
> times out. The callers check for non-zero return value and
> propagate the error code back to their callers.
> 

They don't propagate the error back.  The callers do:

drivers/staging/sm750fb/sm750_accel.c
    87  int sm750_hw_fillrect(struct lynx_accel *accel,
    88                        u32 base, u32 pitch, u32 Bpp,
    89                        u32 x, u32 y, u32 width, u32 height,
    90                        u32 color, u32 rop)
    91  {
    92          u32 de_ctrl;
    93  
    94          if (accel->de_wait() != 0) {
    95                  /*
    96                   * int time wait and always busy,seems hardware
    97                   * got something error
    98                   */
    99                  pr_debug("De engine always busy\n");
   100                  return -1;
   101          }

They return -1.  Propagating the errors means:

	ret = accel->de_wait();
	if (ret)
		return ret;

Also this is a v3 patch, it needs v3 in the subject and a little
description of what changed.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter


