Return-Path: <linux-fbdev+bounces-7427-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iN2QEwpuGWpzwggAu9opvQ
	(envelope-from <linux-fbdev+bounces-7427-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Fri, 29 May 2026 12:44:26 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B93160105D
	for <lists+linux-fbdev@lfdr.de>; Fri, 29 May 2026 12:44:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D7E903056BE8
	for <lists+linux-fbdev@lfdr.de>; Fri, 29 May 2026 10:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47C9F3C9886;
	Fri, 29 May 2026 10:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l524Z/xn"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FCB3C454F
	for <linux-fbdev@vger.kernel.org>; Fri, 29 May 2026 10:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780051462; cv=none; b=SKfDZHiWCFtrA76oxx0z/SuLwZJ2TtvzkPE7iwOrR0OQR39Go7/4FxyONWhtSn2N3xj6XNN2dG87J/o8AHgdWnhlqKwLZKLB0w/wDJYquG77Nl40/+e/m1HPuGmAufHewc1liBILhjkhgdhqnqp2/6xyGdEmuwzD5QrVB+83ICY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780051462; c=relaxed/simple;
	bh=CIupNoGRAJhDCs+M4LryVa/UMfY0kmPZCcS9BO3lfIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ku596vPvmU2Muyz0Df2t5AWIIqf6JUKozEDs06mNK3eKqa1rRunFdfFnIP7AlsZEHbiWxOfInDZJAqVRwtuJcqOOaG/WGZkj9AcxP5w54D7D10KE+klm0cbdUGneSfzYoaNXa3ctjxazVYj7Gzdj9gwi5NTaUCmXgmZ7j78XJ0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l524Z/xn; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4909e3fa4b2so4408665e9.0
        for <linux-fbdev@vger.kernel.org>; Fri, 29 May 2026 03:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780051459; x=1780656259; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CIupNoGRAJhDCs+M4LryVa/UMfY0kmPZCcS9BO3lfIA=;
        b=l524Z/xnRMrGr74i8Gug5QNkwRzju1myv8Im5F4SyectypldyCUjY5yA1RniHhHipj
         psMH/GEPGT+qyywFfM0u8N6T4Uf+mNhmaVXaIH1kPFyfIkFDSQ4C3xdAMe0rDHQJ/ruR
         CS+HP9ls6ugZcNTH2TkuLh2GJ8aNXyeIGPHlSKTOGgpjBf/+gGX9BLABTAY2mgrBotnm
         e/UkCNNgXUAsXVwD0EoWokkzqXBOGLiHOj7GX05uaFXbIlHxTwBpmFuR/xvQgVw/Z9f0
         veiG8j0IQK9olpobjaxGTtX/ISfZPUrPjdBbX4gpNI0nYAHyCpWBtY0cHI5pTbd/gtue
         Kr7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780051459; x=1780656259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CIupNoGRAJhDCs+M4LryVa/UMfY0kmPZCcS9BO3lfIA=;
        b=ToCEtkByy6uG+XDfgq5ufIzb5nZ3z5pr3YMhfpQEMwJpVdVgHMtTvjnxGv3oxwb65N
         eHayv7YYQl9dygut2KHsuWpE8bm7sjDtlT6+8yc40amA7UsV19LEnp+/XEqyvUq66cdk
         t9rPA7SoPnq3Wzo3ltVuaZ0lUPAD1YncxMdbY2jcivIUNiEZQRGZvs0PGYmd9/hmS0jw
         6/gtFOOFrYVQK7ksitRQl/UY3VHwx6nFLUJ1vmH64tMpSq9VeYovASZxeGd90ktjMHmL
         EtgzDYyPVQaZ6Y1xMDCqzSi91tE7lS2FyoPW1wVxj8n02wuBzQptldGdWPEt+odZdbjH
         Kylw==
X-Forwarded-Encrypted: i=1; AFNElJ+94ld+/PTC5HRmoNjZ00b04VedHRoV66G2UEJWz09s5yjhZOENqkKor1UfsyNxYzDlFB6KRUJq0c+pZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNNbdNLk8oUyP95elzh4md1kDytCT8j+bfssouFNj5QiXGokCB
	cY6u78enRf8aO1LJsKdcs4DzQj0Fz4UEHatDfSPqOg+BaJtGZ1bIKOJM
X-Gm-Gg: Acq92OGXbvPaU35ho1CrYQ0bT0Eg2CU3sELO7O0TMqizEt/uXDcxK4q7fh7C2YIN7qh
	0pRRMV1uZG1+nw82JyS1f0aQfKseTSQlU2p9WAgYYQyWaiFs3m5txJtWyxJRqi5Ikoyp1IoeTut
	oyfYT9uzCqyWYctxuHUhE/oXPmZzg+CmaSYmxQc6da3BfgtNNbKMuaEa8y2z21E/xZRyIXIXsyU
	JsTgGWLSyjdnUXU1ARUvU9EPtZnYsqv/2lgLHLTXxzKRQxuXpF8bCQV7QLOLWHH/G4XJnRBsq3p
	88wUo8lUnLUAG/iQamS6+O72+e+jkbZSlBkjmoqY+tyaYE256+DCT+fM8dkxrO7UxG7jkrZViq0
	v8CEvMpKG72GB9sdkaZ19u9mYsjv76427zp0cFmQ0MdDLv4+yzyjMnOqoTKsFpwBP00SXT5aWCI
	uvrJXuaThgCMUl/D1zTe47Rf+fq+0OE3si/w==
X-Received: by 2002:a05:600c:1550:b0:490:5191:6e1a with SMTP id 5b1f17b1804b1-4909c0beca6mr43790855e9.24.1780051459424;
        Fri, 29 May 2026 03:44:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a0403sm2759820f8f.6.2026.05.29.03.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:44:18 -0700 (PDT)
Date: Fri, 29 May 2026 13:44:15 +0300
From: Dan Carpenter <error27@gmail.com>
To: Onish Sharma <neharora23587@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: sm750fb: remove unused variable
Message-ID: <ahlt_3J9HQVz7Zby@stanley.mountain>
References: <ahlXYIqzu4O5-u9J@stanley.mountain>
 <20260529101242.10189-1-neharora23587@gmail.com>
 <ahlszyY6Nd9ANz-X@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahlszyY6Nd9ANz-X@stanley.mountain>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,siliconmotion.com,linuxfoundation.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-7427-lists,linux-fbdev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-fbdev@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-fbdev];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: 2B93160105D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 29, 2026 at 01:39:11PM +0300, Dan Carpenter wrote:
> Which everyone is API is the one we should keep.

s/everyone/ever one/

regards,
dan carpenter



