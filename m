Return-Path: <linux-fbdev+bounces-7552-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id r0eYKgFqJ2qJwQIAu9opvQ
	(envelope-from <linux-fbdev+bounces-7552-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 09 Jun 2026 03:18:57 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C11B65B952
	for <lists+linux-fbdev@lfdr.de>; Tue, 09 Jun 2026 03:18:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="hPmXDR/n";
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7552-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7552-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34E033026749
	for <lists+linux-fbdev@lfdr.de>; Tue,  9 Jun 2026 01:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 053B62D9ECB;
	Tue,  9 Jun 2026 01:18:17 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917F72405E1
	for <linux-fbdev@vger.kernel.org>; Tue,  9 Jun 2026 01:18:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780967896; cv=none; b=OnRpWWgfLVONSzmpIcOP9XU0tWAukJjKdDGp1TdYnfmj/IDDWe4ZvOkfocx1xNLt0LYcGMCMs/zbr2yO3c+Rdt0nR2G/qxj9L796/aA5t/EjiM5vEiv9NRJdLlJQ5vZWYVAiWVttG6Uwqj2ksgwX6xxjXxddfTQetlkWbr02+IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780967896; c=relaxed/simple;
	bh=RFha6jfVWUCB4v8q6yii0Xy33+yTSsEdHGCnRuiCPxo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bpykL6TNYfomNyYMfwiMHGCn3/nEqGois+WJb6x02PySpj6gv526d8TfhQgT/t3q4h/ys4y4ghJU0a+E2iW79CiIdZpOVi8IpfQTVS5jN3TWM7hd+tXBsM++odCBaZzV8GFPurxaXIchCSK6k0A53qiH1Oo+2FjtmLcSSukvU+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hPmXDR/n; arc=none smtp.client-ip=209.85.210.178
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84232e83ca9so2092145b3a.2
        for <linux-fbdev@vger.kernel.org>; Mon, 08 Jun 2026 18:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780967894; x=1781572694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1hCrO2Avcbp9+uaFM2AbILaNhKUQvSHPAv3c0qthXT4=;
        b=hPmXDR/nLgWLk3a1eV5RmbbL46Se6cIkfscqwJkeirpMZBbPW0YotGwUS+NzuP/3K8
         JkGZ0MgiB91vHLdWim+Wf4OyE2kKan93mDjyysxeDMSDVZWlKcdEvaOe/HBIWDvSIW3g
         knSDxoJrhGzWUse4yVapF+jNm1GXPDx3blnOUUfCEzU2RCv4Lyq1FbPYp2MeDSFqprtC
         FP8ILHvx57CRD9yDAeY/roNx+qaLR1OVaYVfko4hXYsh7y4s8EuMaZkxDczw5g5gzT3M
         lgZ1YOhS63I++8OObsKQnzf94t5Xz15uHn4l9fZSCq45zKfph9EkjMS88VkBlrjNKdyN
         qQ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780967894; x=1781572694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hCrO2Avcbp9+uaFM2AbILaNhKUQvSHPAv3c0qthXT4=;
        b=ckwwuvYluu6QYpWdxSBCrBqIUL4mK/pFakbT1aMV9N/w2fgQoXKea1qXAG7oxcDQqP
         zC6XPwNvgAhVNQFRQPH238Q7V0nivF0nPszxHIt5iKmvULVuhZlI7BvDVVFevx7ib+K5
         b4n5/6czQKkk0GGV0lW7nYXojEEWe70V9v3kzWkOrEDNfUnC94JKxSOmeevHUQRgzSI9
         Zq8Xp3DEICEENRYk5nh8J2omF3PDDTUh7oDppC4Rn8vB7X9c4KHJLK/c3D1GCO1/DLYS
         +Ve7/VDHSG8QwrsAUigM1oEQc8AngbhNnnONAOE8c1AQ8fTJO4BOvjkZzfQKMdmcZ3dk
         RJEw==
X-Gm-Message-State: AOJu0YzOlbscwq5bx1kwFPwZ/P45fkxZXxtYRGAdzTInS1e8+sRQDBy0
	HDKY4v2CXzyTCxSpADVDUNLpSXYe5yT+bZUbNMzKfXxqKNUAKn1Dx7wa
X-Gm-Gg: Acq92OGSy84CWXJMexfQna2wLbGaAiwnsYUtMPJ7/lw4rhAsiPlGF/SBLp77Y2ym1Bq
	+nBmylmHWAt8ftOg3dEWjW/9IZcZ7xhxdMBeN+QY3TSDHCLeNq5OQnOmTXOWRnFX/1XVWqBSkvT
	9TdypUehAli/WaGX7UHOS/c3nbm13qShrjtE14afyFvyLDXllmOIHn4C2TYaWGehRiTGUMtZcPR
	/DUAbiKEZXXB9OezFmRrIm/BCychodw2pC3Lt4PNDpVB/DFCVVsJiBw+YTpBhGJKXpYcdb0XiOU
	9zQ81Xnqahv5Rqts0hjaqGDgfSGLx8xJTMpekejffoRHxD2F7tMHDybWnY1RjSYCGQavNy5jhhs
	Av/lsWl1UhRx/zCQG3YHq8DDs9u6lJA1x8C2j2CCKfZKUxychIuvWvao8SqJrv15Df/w+mpclFn
	KX5wfRPD1jebguaoQ2xMJAU9yCcNXkmxdoS6Y1
X-Received: by 2002:a05:6a00:88e:b0:841:dcb5:e6f2 with SMTP id d2e1a72fcca58-842b1065829mr18026265b3a.23.1780967893821;
        Mon, 08 Jun 2026 18:18:13 -0700 (PDT)
Received: from localhost.localdomain ([2604:3d08:2474:4800::9e30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828d6bc5sm18329180b3a.43.2026.06.08.18.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 18:18:13 -0700 (PDT)
From: Brock Haftner <brockhaftner@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	outreachy@lists.linux.dev
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Brock Haftner <brockhaftner@gmail.com>
Subject: [PATCH] staging: sm750fb: make g_fbmode array const
Date: Mon,  8 Jun 2026 18:17:36 -0700
Message-ID: <20260609011736.17401-1-brockhaftner@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7552-lists,linux-fbdev=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sudipm.mukherjee@gmail.com,m:teddy.wang@siliconmotion.com,m:gregkh@linuxfoundation.org,m:outreachy@lists.linux.dev,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:brockhaftner@gmail.com,m:sudipmmukherjee@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,siliconmotion.com,linuxfoundation.org,lists.linux.dev];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brockhaftner@gmail.com,linux-fbdev@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brockhaftner@gmail.com,linux-fbdev@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1C11B65B952

The g_fbmode array is a static array of constant strings, but the pointer
array itself is not marked as const. Fix the checkpatch.pl warning by
adding the const modifier to the array declaration.

Signed-off-by: Brock Haftner <brockhaftner@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 89c811e0806c..8f533f3b1b42 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -21,7 +21,7 @@
 static int g_hwcursor = 1;
 static int g_noaccel __ro_after_init;
 static int g_nomtrr __ro_after_init;
-static const char *g_fbmode[] = {NULL, NULL};
+static const char * const g_fbmode[] = {NULL, NULL};
 static const char *g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview __ro_after_init;
-- 
2.54.0


