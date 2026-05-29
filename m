Return-Path: <linux-fbdev+bounces-7434-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHVvGdZ0GWpSwwgAu9opvQ
	(envelope-from <linux-fbdev+bounces-7434-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Fri, 29 May 2026 13:13:26 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BADC2601657
	for <lists+linux-fbdev@lfdr.de>; Fri, 29 May 2026 13:13:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97E4A3065535
	for <lists+linux-fbdev@lfdr.de>; Fri, 29 May 2026 11:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22CA23CAE75;
	Fri, 29 May 2026 11:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="zHK8lmBu"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E383BADA5
	for <linux-fbdev@vger.kernel.org>; Fri, 29 May 2026 11:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780053043; cv=none; b=DPAKpIeTYqj4oj5mJgpsu9sXpFLRbAal8ZuG5IO1ghKNtqfK9r90f3ntW1wX6yMSYUs01IhPaZUwUIiyPm3wml4G9SEUB08IqZxKYXjLTUyqYKxqWqUZMtwxgI5DQ4JCMZB2TRLgkpIGkJqkiihVoEk69ZiyofzXu17hp1g44a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780053043; c=relaxed/simple;
	bh=VwGJ1aVISsmjGLnoNcjoGKPnok5e19Xi0seckWEDRu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DZYyNyzDMWuLq11c3/B9ZxbcKS/nyLlF+gyL7EX+YXX9uzgKEAAQ2ZWicSK/QTAUf2XPG+UttaP8poZDM0ghSqnk0yI4qaffpHpKY3hM+0aRmsA34t92GM/Lh88S73J4y3wOdONaoPJ1OEO1c0PG1jpKeW2Wdv+VcRr8GpjqFUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=zHK8lmBu; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48d146705b4so146023585e9.3
        for <linux-fbdev@vger.kernel.org>; Fri, 29 May 2026 04:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780053040; x=1780657840; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VwGJ1aVISsmjGLnoNcjoGKPnok5e19Xi0seckWEDRu0=;
        b=zHK8lmBucbZ1kGYWNxWdhPPADUlkMHzI3vr/HtsrxyRdyVZ5iG3yZ9ZYZ57JdWiK8O
         Nj8/ghwxaaR9CN2MwOzZftw6rWW5HY0/VgIk8uWJEEVMnvoeR0jiiV4j2K+iPZNDHjY/
         9OgFRmOq6lzmOS7R44nxtdSpkaGmRKzaIuG6GxMxUpR+4ix131SJVw4fclFmord8xWV6
         5qP0M0B+H24ll019X3oA1PztnydZq7Xmwq4/8bvp+VbE/UP9UETZ5zybyKl7IoBreLZm
         1wEMEitUqJog6Sz0xtKz1eCC7dgcDpPmMf746vzVqLxWRsu8QSDGuJgSik4+lf1xmny5
         Pjgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780053040; x=1780657840;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VwGJ1aVISsmjGLnoNcjoGKPnok5e19Xi0seckWEDRu0=;
        b=IGHPJpu+5ONLq7AyWY3Fp0jWZqiT2yvXG32dAZbjEbln5lxWSFXbwLhUat7geswn6a
         BF/w5gjzXccXrNfZvFwwHFWkdz6YWAUIJoSOeEFd52liCaBiN5Y8ckhgOKIn8ch+PbbR
         HEaHKKHJvMJQynJ0vo4Bp/v8xku5Q7G3ccqHiasfjQp1zajLXeIL5BDWrmmzVbEODpLC
         FTjjLRCj13EBINY7RRMkI5nyvc+AHFG2jcyLwcAueqA2/fDFck9dDfMcs7MF4BmVV4YO
         RR3l+8tERpYvc8ZkxZgZwpeFQy9PkiBkfAyFf0BxZfdjua31Pz/1X2vSfG/EkUE/WOlB
         EE+Q==
X-Forwarded-Encrypted: i=1; AFNElJ8dSsgqz4N7CuCUjkAz7b7B9FZBsGopCs9Pr19jaMr73lncGBgc8HsohpoAIbOe8vQxHxqJdR9A69ca7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuUcntxN+nYL3KsU43VaXSZb4H+O0nAiPppb6hGeaPWuR/9Y/n
	oLPdB0u4XqTjs+ZI/GQgBvu/n3eH/A2kLHS6IBRxXf/O6q3Dlxqalph2qJDiarxmzt8=
X-Gm-Gg: Acq92OESYGZDN0zuskYz9uamlj8iKSRt5RQolw5dH/8OQ2TY5xLcXsmBTRjeOkdtT8l
	4bZGBXvDo7YJpcL4i0HbZZBMlWJc7SfXUmYE5D7JnfkgD5WvgRbcXT9aFpVFafyS2UGPhh0lKuk
	266Ap9n/yhS85njDX/0Cy73qlU0JbfIhTzvnqfCRr8QKdNxB4uPEcGJkvwjsU62emNIrYqLSnv/
	lPjMufcbcYukZJh75Af6yHMS2g9X97vosY3KJegfvxP3+Gsj6VQwKvZ2aL6rEW3JG9bYXKeDUu1
	+Beyk0XWDBvwL/voZuj4UnpOnQ27mM06QjTpBAy5DgMKhRL6qO3VKLxm08Bu3lsqLXilFTr/1mM
	wG2pEIGULwHauKljDRudeHkr0bmdszhYUdQZ9hb3oKHYXmcqhn9c7kRIyiSULGtaXGYpAMgYTRy
	gFa9xfwcgBWPOMhXVHvqPPKhEn5FYVV3wqkSsttFqvPfhFN/72x1e+4u2ZzC3f9Nbb8Ifclj4Kc
	nXOyFMiXCJIQ+qkJFQkTlMM8qDmgDCfT6TABKqY80RGIgTu9xHZ/BE+Plz/Fuot59FFC8DLZIeB
	p3PMb3l88XpF7tZleeex+dO9cPiEFg==
X-Received: by 2002:a05:600c:4595:b0:490:52fb:12dd with SMTP id 5b1f17b1804b1-4909c0a4c85mr41540435e9.10.1780053040047;
        Fri, 29 May 2026 04:10:40 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c103b98sm11912765e9.19.2026.05.29.04.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 04:10:39 -0700 (PDT)
Date: Fri, 29 May 2026 12:10:37 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>,
	Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 5/6] video: backlight: lm3533_bl: Set initial mapping
 mode from DT
Message-ID: <ahl0La8OQHXAlV3m@aspen.lan>
References: <20260528135123.103745-1-clamor95@gmail.com>
 <20260528135123.103745-6-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528135123.103745-6-clamor95@gmail.com>
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7434-lists,linux-fbdev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@riscstar.com,linux-fbdev@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: BADC2601657
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 04:51:22PM +0300, Svyatoslav Ryhel wrote:
> Add support to obtain the initial mapping mode from DT instead of leaving
> it unconfigured. Additionally, update the linear sysfs code, which uses a
> similar coding pattern.

Words like "additionally" in a patch description can be a sign the patch
should actually be two patches. In this case the patch would be a lot
easier to read if you cleaned up the linear sysfs code (patch N) and then
added the new DT logic (patch N+1).


Daniel.

