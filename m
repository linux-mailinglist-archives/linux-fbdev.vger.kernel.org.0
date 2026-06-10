Return-Path: <linux-fbdev+bounces-7576-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4lNoGyPhKGpkLQMAu9opvQ
	(envelope-from <linux-fbdev+bounces-7576-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Wed, 10 Jun 2026 05:59:31 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 367A6665AFF
	for <lists+linux-fbdev@lfdr.de>; Wed, 10 Jun 2026 05:59:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=kmuVfm7k;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7576-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7576-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EE1F9305A361
	for <lists+linux-fbdev@lfdr.de>; Wed, 10 Jun 2026 03:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C53A3340405;
	Wed, 10 Jun 2026 03:58:08 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A8933D6EE
	for <linux-fbdev@vger.kernel.org>; Wed, 10 Jun 2026 03:58:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781063888; cv=none; b=kXVisVyVVZI0+ZtGPGs4otNpbaoS1w1T6dL86GezZ7sCPIRnv0a78XbFk1ea1Q37anpC8bQ/RDpUW2eXtco8QHm9bS8vNX8surFyerZOLr2T13kHhuXw7ffryoWoaC7qR8AOoZtU48hX3ZmMyeMlp3RdrXHPOMM/PsNtFKI6H/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781063888; c=relaxed/simple;
	bh=LkLL8oxERIIN7i2ChnjdvxxJhGfr4g3QrWkswhh/OpI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=Y10Dr4FXeNag5Evbk9nmq7RJ17UOcdUPKs0hitNwf6D5WxvQe6Y0xGIoaNaAsQl5UQlSvW+79SarSUCT54wu7YIej6zobCSL0kUKwVXSYtGavtAp3xwd80J2+DmWDlRC2scy6ESsnC6pWakctFDcW8H5jazoNCHj7L83enHiLBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kmuVfm7k; arc=none smtp.client-ip=209.85.210.169
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-842338c18e0so4393342b3a.1
        for <linux-fbdev@vger.kernel.org>; Tue, 09 Jun 2026 20:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781063887; x=1781668687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=naISrfL4FjYY+Oc5ijO8SPNLr7S9JNpMix7C96yvLnQ=;
        b=kmuVfm7kyuKSFg1ZwZpLB+Udzzy3AAvoZq1eFGg5d7wwywJIkkX0gMX5Ja/Roa2RJ+
         12mYq0bNERl39MHJr/CexCiDP5U/JMdYPYVmBpmf7WNfKFBhddFAMak/FKfKjsftO0Qv
         WqiDmhzKaQcRiByTiO7ocoVVwiRHbAaj1AJI1OMwZ2F6WN8w7d8Y3MhNj5L84+K/zYRw
         p/CvIkG+dSa2snZKJt7NbNfieHtIbkhZ/8q0/rjHolim5U5XLMA19DuEZUQt7ONtCWZh
         tKnKjDuMpYFsNwiIXMDjmHJfeRZDA1zlNhL8RuaCSeBZikeDyHLC3hO9knQxGAAll2qb
         vWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781063887; x=1781668687;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=naISrfL4FjYY+Oc5ijO8SPNLr7S9JNpMix7C96yvLnQ=;
        b=YBh9vbBp2OsPeIilKN5mL5MQgXkabmMXKRLiQQlwqwWDQLspvD+/O8wEEwQwVopXuV
         Y+Sbei6s2aZUEE6fi8tJyya8PiZ1r0zBxI5jq8o+fiOI7PHNrfgoVKYDN6uAjhptehIN
         /E0yiZMIQ/mwRLLydM0hEMmxCHLlIWYLG30iHr9UZK6TGrm0Lb5DgTgZpAuE23t3LS+v
         X4aMAyp8XzVpCfOG4TPGqxeFGGJVXsvmOlXNVMBt1NVmZhqORQnAtsr0ZucVIgQDkoE0
         13HkHVWJha2NKzbdkQkNDjcvqGupiRo6A9KBbOD4+leZ0VG2I54Oel4OmlUMpEoQGxwz
         q2Bg==
X-Gm-Message-State: AOJu0Yx/J5DExMiaRNUTbwimkWDVLRUCYvnlFvinF/EPwHVxBd+oiF/g
	hhgKEDDH1vUIyCPCQlPfPmskHDSyV8dnGqV5jnkl6lfG7JSvkJUZKKIlJsZItA==
X-Gm-Gg: Acq92OH6yhaJmAaqQKQL2+UTn92GtUFPQv6RFhV2QMmNE4/oF83NXiiE9JIJWvyQ9k4
	uZNkD2pfHQMSqHV0dJ7EeYSV0TyyB3b+1sXbD5gawd2M0N1AnbavlklICUgSaQwv2MOJH7zATXL
	m5f+lq16eeQ7tcgV31FrUf+/mH/ks+t1lr3jmTIRVpXgFrmwfKW31Bk6N2xy5dE7hsRuCTR+pBF
	8T+8/RjCaRg19DmLxUm1ZNkzhBWE+pgWkgxJxwJgNLHAQIY/TB7P+LWBm8VkoM25/3z01RleL30
	h3eWQEh82h0oF59KiX+QTCZi98zUpR8h1FsgEUsX26F7w50O+rVseMNPN8MOiu7pdcXVUSrJeTt
	Fsm/x6J2EWFTGp6DLgflKONcN1V6YxGxJvC3PeKkGyZ7rieJWsjS9X4lyujlaZySdi+U5VOH6xN
	J4zloWSHUYwgB5ybdkF2sSmhatXXDhpFbgoVchIND/5BlGyTOSMTxbNmD7TCGBjRnJsBeR7DpMk
	gqksqiGQYHX/azBvC55+k8kNiKRgb3aUgmkZD1PwYUXiB3s+Ydz8YZo6CeGQWMeiIYrjC2Yzh2Q
	+5cNyjlYxGGXEYpF4n0tfCYh4BU8Gp4X/SzVfVIEYRpx
X-Received: by 2002:a05:6a00:2789:b0:842:614e:cc94 with SMTP id d2e1a72fcca58-842b0f56f5amr22823734b3a.26.1781063886787;
        Tue, 09 Jun 2026 20:58:06 -0700 (PDT)
Received: from ?IPV6:2601:1c0:5780:9200:cd04:389b:8bcd:6483? ([2601:1c0:5780:9200:cd04:389b:8bcd:6483])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282918b8csm21810243b3a.57.2026.06.09.20.58.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 20:58:06 -0700 (PDT)
Message-ID: <c82b582e-2aeb-41c6-8389-25aeeaf46704@gmail.com>
Date: Tue, 9 Jun 2026 20:58:05 -0700
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Chintan Patel <chintanlike@gmail.com>
Subject: Patch submission preferences: request_mem_region changes in fbdev
 drivers
To: linux-fbdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, tzimmermann@suse.de
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[chintanlike@gmail.com,linux-fbdev@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7576-lists,linux-fbdev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tzimmermann@suse.de,s:lists@lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chintanlike@gmail.com,linux-fbdev@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 367A6665AFF

Hello Thomas,

I'm preparing patches to add proper memory-region requests across legacy 
fbdev drivers (use of 
request_mem_region/pci_request_region/devm_request_mem_region where 
appropriate) to avoid conflicts between fbdev and DRM drivers. I’ve 
started making changes (examples: pvr2fb.c, macfb.c, cyber2000fb.c, 
xilinxfb.c).

Before I prepare a patch series, could you please advise:

Preferred format: a single combined patch or a series of smaller 
patches? If a series, do you prefer one patch per driver file, per 
driver family, or grouped another way?
Any drivers or areas to exclude or treat specially (e.g., vga16fb or 
VGA-exclusive ranges)?
Any tests or checks you expect before posting (build, boot smoke tests, 
Kconfig options to verify)?
I can prepare an initial series and send it for review; I’ll follow your 
preferred format. Thanks for guidance.

Thank you,
Chintan Patel

