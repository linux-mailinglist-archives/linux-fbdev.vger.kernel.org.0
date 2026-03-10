Return-Path: <linux-fbdev+bounces-6543-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJLEHpkjsGnYgQIAu9opvQ
	(envelope-from <linux-fbdev+bounces-6543-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 10 Mar 2026 14:58:49 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 83093251214
	for <lists+linux-fbdev@lfdr.de>; Tue, 10 Mar 2026 14:58:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7724432CE887
	for <lists+linux-fbdev@lfdr.de>; Tue, 10 Mar 2026 13:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC64F3D8122;
	Tue, 10 Mar 2026 12:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=noa-labs.com header.i=@noa-labs.com header.b="T1eSIP8q"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AB13D811A
	for <linux-fbdev@vger.kernel.org>; Tue, 10 Mar 2026 12:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773146107; cv=none; b=tR18IpyB36zBNkW8FsbgWqcXgfOSQg3q9/Y2Z0yze3CNUmWY1UHWFhacblk6fFYGCMAHwd3uMkW/2AfYIQHKMwAPsTjmDWbbIXaFdFFBUGH5Na70CZWI7G1rsHTlwtwWgMYZTvGbrJb+7P3XNHjC+NefnSTn/8Q755rtaBEq1bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773146107; c=relaxed/simple;
	bh=BWifzTTU8+E5T05MnLWIwAZPVtGis7wYRZ1AV6QuWIM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nqxsnmM9/jsT7wUx98F8L/m/U/ujDPS7PR/wciRgfkWBmCeBrwljba77huLLI9ldfCFbufal18vHXAEjYwK+JeOXeeSJgNKux9apaFcSDwwsLi+8R8uS9x75MkGIcZsqlf7VgssLWZit1xBPmliQw/ihCkkek1xaz1VW8mYaZ5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=noa-labs.com; spf=pass smtp.mailfrom=noa-labs.com; dkim=pass (2048-bit key) header.d=noa-labs.com header.i=@noa-labs.com header.b=T1eSIP8q; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=noa-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=noa-labs.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a140efd2d5so4435585e87.2
        for <linux-fbdev@vger.kernel.org>; Tue, 10 Mar 2026 05:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=noa-labs.com; s=google; t=1773146104; x=1773750904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BWifzTTU8+E5T05MnLWIwAZPVtGis7wYRZ1AV6QuWIM=;
        b=T1eSIP8q0pak6LVObwRDuvcQSkzRdBCq+E4anqf7iPZLrbOyVnQUIuR6dkJARJvXsU
         fBspMj1U3f/Hfc8J+v4Ael4HsrPLGHTegMFYJRpw7hSl/BpT4o1S9YalSgy4scYRwLBK
         FZloJg2vU50JC0cRfNeCl/XD0ZksWGIm0ZuUV/C1dqXDDjWsdgYDh4Cfnwcdk4KuIf4N
         kUXv/HDRvDfDVxLgpfftceYOFvrHLFXfKGY/wiuvOBC0cluHAo6ync9AnSbFGmmXQWX/
         j2RczdZYc3yuAoiyOAeJqy0AgDvYFx/HoKIKxtTj+IbJyYqBKARpJDhJ3WqvYY8LLt2S
         4geg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773146104; x=1773750904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BWifzTTU8+E5T05MnLWIwAZPVtGis7wYRZ1AV6QuWIM=;
        b=GWY0I0WcTYLbkP/7F3ivJeKg1/wYuprgyektkTSmyFwVSpCSbbnDWPIwVRIyib4pS3
         ubBnADfwk0r6rYqDr+7lUDHLdElNKgsHdjp2bC7fF/oNnHn/EDXULyoKcn+TUqpsYCuV
         cBQ9m16OIiy45KG/k0dSe51wWzPZy/kLz78D0o+zVWVojOcmnolY1B4rxFCOZCzNHD13
         ITULU9OhdD1qcxd6pYeqHJdETRIfegd/EeNBY9Uu2LDX9J9PGfygjVZe2TJT+w4RBnUw
         dSOxG39AqBiTjyh1Nsy5wpkQMPP+AAUSh3r7Q1ayPiebaQWZc6T+wurqJ2tQQmhSmyZh
         3S1A==
X-Forwarded-Encrypted: i=1; AJvYcCVAw1j9e75JVLAZEQ0GASQW1nkpBg2krTVHLKS+tPIkCuN0kFNHQ4/CIvYRlmduvQzd84ENyEiBTaQGCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YykHjcH7XA3oPKz4XlAo8p3Cze3rqSBvBYCBaf0s72lkcFS82WE
	26PP5vNEUSzVNyuKUG3T4n7gX7pS/Rev8xlZtjf21MM51QRHhvBc1VZvSEbcmqBssnE=
X-Gm-Gg: ATEYQzyssSpTuGtd42c2jO5u3jguKvpMGWEhLO6tdyCa48UE28pIjC1mt1+Ay71cFu9
	+FPHG0ghZ1NW6mp1dIqhwuI8C657hiZ2So6nIh6PDNDZI7ohXvdF8A3qHg2WaGOPamzpIT3yvE7
	ONZHl7ARCLnjxEA1GJ4t4i7NEjR8ACDQcDuv1n8+rKwf/TVlDb4Cup9nEDwn/lDtSf+/VnsAu9K
	e4Y8AxH9Wa2USJN/wi7Ky9I+ZGb8PkjxTSKdf/r9w+6gk7+5kf/MqCZiiHoHsTzLmPhiNHs92yF
	W67TPqz3vfXknNGk72LC9yytCTqVnMaoj1KoLZ1CruWNuXKAZVvb1z1NwPZDUNHS1QBUEOLlh8h
	9AD02H2icLcnfwlJXarJzV4C/219GVNYm2ejH0Us+q4CHaDCzct8VCXLzCalPf238s7lQcCqKwB
	fAESHB7j2dUpLOYA9ubQSRUtdf9xZzrcYrIkvkCyvLsJkuXhrm7wafwWe+1QrJrExRUa5LhVLlt
	RJOFMQ2iGo=
X-Received: by 2002:a05:6512:12d4:b0:5a1:4514:86f3 with SMTP id 2adb3069b0e04-5a145148935mr2402508e87.30.1773146104334;
        Tue, 10 Mar 2026 05:35:04 -0700 (PDT)
Received: from zenbook ([80.249.137.130])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d07e16dsm2718011e87.42.2026.03.10.05.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 05:35:03 -0700 (PDT)
From: Pavel Nikulin <pavel@noa-labs.com>
To: Helge Deller <deller@gmx.de>,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v5 RESEND] Fonts: Adding all Terminus fronts from 12 to 32 in bold, and normal versions
Date: Tue, 10 Mar 2026 17:24:02 +0500
Message-ID: <20260310123327.9172-2-pavel@noa-labs.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <aaIFr-GKG1qiJYwg@p100>
References: <aaIFr-GKG1qiJYwg@p100>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 83093251214
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[noa-labs.com,quarantine];
	R_DKIM_ALLOW(-0.20)[noa-labs.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6543-lists,linux-fbdev=lfdr.de];
	FREEMAIL_TO(0.00)[gmx.de,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[noa-labs.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pavel@noa-labs.com,linux-fbdev@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-fbdev];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,noa-labs.com:dkim,noa-labs.com:mid]
X-Rspamd-Action: no action


Hello Helge,

> Why are both bold and non-bold fonts needed?

Because people have different screen densities. On those 4k 10 inch screens, people would probably go for bolder versions regardless of how much text they want to fit in.

> They may be loaded after bootup via userspace too.

Too many fonts are already baked into the kernel, and I would've advocated for eventually adding a function for PSFs to be more easily added at config, or boot time.

Terminus is a good font for the kernel for the reason that it covers a very wide range of font sizes.

On the sidenote, the previously incorporated Terminus font patch seemingly has a wrong FONTDATAMAX value

