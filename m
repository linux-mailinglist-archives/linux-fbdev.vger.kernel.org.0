Return-Path: <linux-fbdev+bounces-7795-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E5x7FOD5RGp44QoAu9opvQ
	(envelope-from <linux-fbdev+bounces-7795-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Wed, 01 Jul 2026 13:28:32 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 556FC6ECCE6
	for <lists+linux-fbdev@lfdr.de>; Wed, 01 Jul 2026 13:28:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=qfmrsrKe;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7795-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7795-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3FB13300ADAC
	for <lists+linux-fbdev@lfdr.de>; Wed,  1 Jul 2026 11:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F2ED421F10;
	Wed,  1 Jul 2026 11:21:56 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108DF3B440F
	for <linux-fbdev@vger.kernel.org>; Wed,  1 Jul 2026 11:21:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782904916; cv=none; b=OEGF5YaHJBfI3H2Bju3SrToMn2cvMeq/PzMW3TNifjw5cdgXk1NdXikwzPvsZ1y49qTvntK00HEVG5lUODUdQQ9XaJt1p8k2ckWn6hYYqycjFxGRl60rHWlp6763wxJK1KMKsB0viQLUmyhj5ZnqJZ4F2/HabxnWR0WZZA3E7s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782904916; c=relaxed/simple;
	bh=1MdE3ZVANLVcrQqqXizzWhKPfKpAh126mYxfQA5Vl2U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nm/ThL1eX2aMeibQ2DdevjM/E+spQJJCpqQFLyPsOsONOTkIuDhz1NuMtFfby0qZ1w+l85OcgTJiWlq2PmbNlqPxfGTU84RHmzCEJDQ4wARBtsmvoPnlFEPU5q75CGE05+qRGELwkFFuaIFxzBaiqsk/TOV9/9kvDVqL1h3VDVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qfmrsrKe; arc=none smtp.client-ip=209.85.214.180
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c9b1edf2bdso3120955ad.1
        for <linux-fbdev@vger.kernel.org>; Wed, 01 Jul 2026 04:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782904914; x=1783509714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OS0LsnXAxJQ3vwP/NL/yX7kz0UHQjnYhTFVyVOyFmPo=;
        b=qfmrsrKe8Z+CSxCK8SS7dnR+QKKe08Dy6pJlp28EhafeOohDAQOc25iFUPmgZFyah5
         n4uXlFpBmX7CLzmDHpQ6BvtwtGBRtMz3To4cNlme5N0L+LM0+wwxU6ANfovsri5anJ0x
         oor8HFomugPeqLw53FEgXrNg7aWj8d+6l1g6b8NGCdCTz5ZOJ50Mo3G/jgz6lSlsVd7Y
         LNLsg3jgC3gQajCMpGGbNbGMt8vUocJtz+o3aUvZsbuUdvpGD/tV9GdHHj+avpQ78hti
         QGSkmjf3F1NIBBQXl1xmRXNddldcRtLGwM+IjznceFi8LyuJUO8PDvNaNFn3yz2rt7qV
         lzpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782904914; x=1783509714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OS0LsnXAxJQ3vwP/NL/yX7kz0UHQjnYhTFVyVOyFmPo=;
        b=k05cyG9yeCpby6BOQx6tYw6sdalNQ+KY1UvdM5uN4AILxdMMB3YZYVZ7Ki9pV3a+XC
         42pLV55MG+qcXGenJxS978CP54THBRAy4KoPeHC6nLIvT5qKqLyMb244g8Q4fonrjvi6
         52F20HYsRJkEE+Oz7DE68OFHFVh9jXnvPzLDzFz7wv89eimWHQxfQLZ0AKfGPq/HqekP
         uc/9lDEZpqvjui637DUC+MA0FuwWdqQ3yyDdAgPdxKmzYAjITWQp4k9NtUFzCTuvXQAA
         /UNKk7N0rWydp3093ekIQ1W4CBcTxuuW23ogmDiSoDFrInUexmkeDjdT4so3/qqF3wo1
         gkpQ==
X-Gm-Message-State: AOJu0YznBEoBIK0S2Bdd9kaveuBH0bEhMTBy9ut2HWzC+9czPBVsu5iw
	SGDtlUxYrsys1Sd6YlOku9D3aKuHMOIuV2KtohUTYXGwqpJfqf1JN5s=
X-Gm-Gg: AfdE7ckrf5nI20oDa7q0iScT/4MMlme4gJ2wlPY/XQKRdXi/qn08ktnEGJYnDYcFIsm
	bxGMLdTP5plEQh6q40k1N0qp+ZlBIdAjcgZGETA7mJQKLK3dlb4jT/T8k9Mrqj7ulaWiW0s7yGd
	bAdLIC714bpLHRmd4xdMX7wc1l+li81GGBwKqO1u7mFdbOQyUKoPwZ7owDKnAZtqN5ycL8mcPsc
	efXUeTdiaHbV0zj7/7i4TuLyI+SFO6O0tM9sllGOkqrRND/kixuZ05lco/XpG1met/Er73a3VG6
	hoYC2+aTQtBWdSUqo5xgxjEScqkHzI/EHGng/t+1EnTsXQTSKBHmLPKvweB71qJwSFWASBQQaKO
	zID7oz9pW/TrTH5lt5BkkhbmD1T4qVMcQyhz8uyJIBX+FH219hDptRIvDWS/PxbqxCDQ8AOaGkO
	ovwVtx2T4ylKE52nax3rdp+hgLlUODu9uT/EbpHF0TRLeg5eXLWu6R/wc2H0uFwoC1QiDheXYQ5
	ZdEACEY6E1el1a42TqHyFWweCVm4pYOuN7tquS/753HDOZDFQ==
X-Received: by 2002:a17:902:e811:b0:2c9:fec5:ae82 with SMTP id d9443c01a7336-2ca7e8b3a8cmr13662355ad.44.1782904914264;
        Wed, 01 Jul 2026 04:21:54 -0700 (PDT)
Received: from localhost.localdomain ([14.5.152.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37c738easm30622375ad.20.2026.07.01.04.21.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 01 Jul 2026 04:21:53 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] fbdev: tdfxfb: fix PCI enable cleanup with pcim_enable_device()
Date: Wed,  1 Jul 2026 20:21:47 +0900
Message-Id: <20260701112147.55048-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-7795-lists,linux-fbdev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:deller@gmx.de,m:linux-fbdev@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:mhun512@gmail.com,m:ae878000@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmx.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[mhun512@gmail.com,linux-fbdev@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhun512@gmail.com,linux-fbdev@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 556FC6ECCE6

tdfxfb_probe() enables the PCI device with pci_enable_device(), but
several failure paths after that point return without disabling it. The
framebuffer_alloc() failure path returns -ENOMEM directly, and the later
shared out_err path releases the framebuffer and returns -ENXIO without
balancing the PCI enable state.

The successful probe path has the same imbalance because tdfxfb_remove()
releases the framebuffer, mappings and regions, but never calls
pci_disable_device().

Use pcim_enable_device() so the PCI device is disabled automatically on
probe failure and driver detach.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/video/fbdev/tdfxfb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/tdfxfb.c b/drivers/video/fbdev/tdfxfb.c
index cc6a074f3165..7f7c268c3b0d 100644
--- a/drivers/video/fbdev/tdfxfb.c
+++ b/drivers/video/fbdev/tdfxfb.c
@@ -1385,7 +1385,7 @@ static int tdfxfb_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (err)
 		return err;
 
-	err = pci_enable_device(pdev);
+	err = pcim_enable_device(pdev);
 	if (err) {
 		printk(KERN_ERR "tdfxfb: Can't enable pdev: %d\n", err);
 		return err;
-- 
2.47.1


