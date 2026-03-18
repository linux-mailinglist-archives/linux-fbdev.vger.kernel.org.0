Return-Path: <linux-fbdev+bounces-6659-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCIMKULwumkBdQIAu9opvQ
	(envelope-from <linux-fbdev+bounces-6659-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Wed, 18 Mar 2026 19:34:42 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B26C02C15C2
	for <lists+linux-fbdev@lfdr.de>; Wed, 18 Mar 2026 19:34:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C361A302DE43
	for <lists+linux-fbdev@lfdr.de>; Wed, 18 Mar 2026 17:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA2E52FDC30;
	Wed, 18 Mar 2026 17:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LcJx+YwN"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C7B27E04C
	for <linux-fbdev@vger.kernel.org>; Wed, 18 Mar 2026 17:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773855300; cv=none; b=H0M2DFRqH7FEiI+pPdh+I6lxG9QuNTsoA2swec0YtD6yNyEveP2blyE041iQDB94NK/iHSS+O7NViZgk+eB5spveH6XJOVlGoBX1et30UGz1KTBg1IJwmgIZ1Xt2Cz9vk/1K0MmYeQp/O/XPIhXgnGEU9G/7JAJajtMwRtdTGQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773855300; c=relaxed/simple;
	bh=HVL9JcuJJwe/eCTwUdao1yOahP99oeFx4kBMvT+jP1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lOG3PS+3APXDHGsIwUFXupUlwTs1G9SMzdglzu64TrIavo69gN2cBS29yRLprNpiORCipa9R9acwhTxiPqw8DwDScp09Sh4IBx/P9FQ/VU6sTkOx5tjmQz7Ii4yIbQBBDvOvXocYaFRK+Dg3lu2TbgtG+Zg25inC/81Ibsh2xcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LcJx+YwN; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3591cc98871so103597a91.3
        for <linux-fbdev@vger.kernel.org>; Wed, 18 Mar 2026 10:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773855299; x=1774460099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=49tSaoOy3FsaSDvjZTaErELVAoylTB6lCBPKg4WidfI=;
        b=LcJx+YwNGpLau4KT2H+gvcgU98UDGANlqYneQdVAqgrEKSrKB/SLf677Vng6gYYI1N
         qY7Lm8nFkecv4KUMacYSrd3wkMSpcXNe4vhnygZSRzLNql1nHwkQRQXp2A2B4TK0kOy/
         tXRhIkuW5w0eU5Gf+XMIQou2da3lauhdYHUcvoyS34wX6jQViRFB+v0NbCxgsTbxS39m
         TMbXuT9IUb6/5YDZUVxBIbPfX+LzUCkkOv+AhryLFT7PGmhLX/lbHMUE4YWL8O4I/yve
         ONVKaGZc2//tqoFbFFiC1SQuhYsAZYI/G0AWHPY67J22PIRRr7J0juGB8Ln6xipRj0SB
         RlbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773855299; x=1774460099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=49tSaoOy3FsaSDvjZTaErELVAoylTB6lCBPKg4WidfI=;
        b=JWUWQZTinKCeS9uow6UqNYnqXnlK3aiH8M3TRX+LOfUZ22/dlcYirWace46mDYEVAW
         3uS+REKKg18qT8juvx7i12BRg6iUrIbsyroCDgZjkILuKLgau6AZKbZxR3FBgX0EYz5k
         JnXnLR/3fZTL5fG6i/RZ1iJ5OP4mel9uxTgTUVsLa8sNm9WLTxdztZlqCAWdEyjvwQoY
         yUT5vucQrG2quFNpXi4uAcFlD9nJGSRt3z8mcblNFmoK5FEJfedfoDcOEcd5JVAVfngj
         QDVqPRdSvrX0fHPUrEoa6XCTQ4iPpNGRroD0pKS0kv5+ArVwlCbWcbSm5yxozgkmbfjw
         dhaQ==
X-Gm-Message-State: AOJu0YymhyoAL23l5W+d2X4fmPYYzzKgOD3tOVkOJfWWglSFQ8vGBmMt
	DigY+mrtQlOWkF6CwuGIiouxjvsHJrjp40TLJCObGFYgLwYcpYvJLjzE
X-Gm-Gg: ATEYQzy5u32/8DRrOojOsGQORjpqlwaGDQSV22naV7rLYwshEXjRxUDvaOxVMvZsM/r
	n9ZpX/TJXI+fbHpVXV9ssPTSk13AHCH9pZhKrUrCQiSHNuOFQaAYNyPcPf9CMDAt8E1VwDjX+uf
	vyCjYP2QGr8hUiwzu3joQdBgZfaSkSNkifXNWRW2O7HXLUPdxSy1R6aJQr+hYAYo63kSRjl4KvH
	g04IFMKasQLoo7EsJZW/GV8ymZ2O6iOTq/RehIWU69A4lh9jVTmhnW1oZTitR56g9M1XH98l3ni
	4/a4U/z+5xU5yDCKdE8AhHD28cG/5twotXEMvxsBQDdY3EdlAfpgFrj/4fdRfnwjzy7PqPdcqLW
	rwqavZFoFstHiSliLwVlGS4yiLgpr/TV2HHkGGpKjP84hV9MixmYCjQKkrtm1hBGrEsnu/GjRCh
	SgEctRhFTBMIoSolcc/35FrA35L+1DS+4Sr30=
X-Received: by 2002:a17:90b:184e:b0:354:c593:b1a8 with SMTP id 98e67ed59e1d1-35bb9e7d24dmr3884224a91.13.1773855298811;
        Wed, 18 Mar 2026 10:34:58 -0700 (PDT)
Received: from fedora ([2409:40e5:1052:9a56:3b6f:933a:89fd:e530])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc5ff704bsm247103a91.2.2026.03.18.10.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 10:34:58 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: gregkh@linuxfoundation.org,
	sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Subject: [PATCH v2 0/3] staging: sm750fb: Clean up CamelCase names
Date: Wed, 18 Mar 2026 23:04:37 +0530
Message-ID: <20260318173440.9457-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,gmail.com,siliconmotion.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6659-lists,linux-fbdev=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[chakrabortyshubham66@gmail.com,linux-fbdev@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.690];
	TAGGED_RCPT(0.00)[linux-fbdev];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B26C02C15C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch series renames various CamelCase enums and struct members in
the sm750fb driver to standard snake_case to comply with the Linux
kernel coding style.

Changes in v2:
- Wrapped all commit message changelogs to 72 columns to fix 
  formatting as requested by Greg K-H.
- No changes to the actual code.

Shubham Chakraborty (3):
  staging: sm750fb: Rename enum sm750_pnltype values to snake_case
  staging: sm750fb: Rename struct init_status members to snake_case
  staging: sm750fb: Rename struct sm750_dev members to snake_case

 drivers/staging/sm750fb/sm750.c    | 34 +++++++++++++++---------------
 drivers/staging/sm750fb/sm750.h    | 16 +++++++-------
 drivers/staging/sm750fb/sm750_hw.c | 26 +++++++++++------------
 3 files changed, 38 insertions(+), 38 deletions(-)

-- 
2.53.0


