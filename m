Return-Path: <linux-fbdev+bounces-7500-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +WHJAiAoH2rviAAAu9opvQ
	(envelope-from <linux-fbdev+bounces-7500-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 02 Jun 2026 20:59:44 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 526C8631422
	for <lists+linux-fbdev@lfdr.de>; Tue, 02 Jun 2026 20:59:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=rong.moe header.s=zmail2048 header.b=g2qDwrKE;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7500-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7500-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=rong.moe;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B74033097989
	for <lists+linux-fbdev@lfdr.de>; Tue,  2 Jun 2026 18:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A1239B49D;
	Tue,  2 Jun 2026 18:52:09 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E98396D1A;
	Tue,  2 Jun 2026 18:52:08 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780426329; cv=pass; b=GkqA9pJUd+15sWflyGUL9+KzgUcWnouqftY+CC9uynHugvcOJvRWBlrgk8iyNqq2PvHNlI5QLCcSdImJO6rS424UqMb/R/YBUx2ka4DTyzXmxFbx46BZ+c+gUTk1/baD707tsgsiI9sGc3x3EVOlFzwBX2Oik1HUZgGzu9LnmW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780426329; c=relaxed/simple;
	bh=ZlnH9r8Fhh3dqeR4cVk62igPb3WJUpTs1T25E8riJ+E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=E0NCBQeC5i0ViHzpo3xRO4rhczDqWICVDtj8sHIK+4BUgt657tYncHE7Skod1wPX+OP/jmq61p0VC9K7xkD9LUz3qWfpnT69p87FZzVBxFnczzwgca1oJNGSF6+Bhe3VfdFUwXq/bThYZQBn6mR9NXFf5TxmOON1EeC3MfJC6w8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=g2qDwrKE; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal: i=1; a=rsa-sha256; t=1780426314; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Nk9he66goTxdmVT3YfzbDyU1tN8k/ysSn7Bv7kmfbvoiLWiX38RM5cCuMe1WvqjsOQ9aGBkwN6p6hSugNDL5IAjEzr5uGm+HoSjTKMW/ZyIevJQZ8Zs406MCB5RcX4UUl0Gkve1wMZ0SBPhaYaRPudbOD9cKrptO/TsYvxOfrqU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780426314; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QS1+lWdfCdPK42+UyX4X/ZphgPLAdaSYGkCMqQkpa9w=; 
	b=bQj1WTwDxFb609Kv2y9szcuT0O+NESAZQKgv28qzTQPJJgwbzG5p2uZDgElxOE4CwhdC9bOsjdrV+3BstxTMd2NBtHwbxne0XNlHFa+BlL9WE/eaT+iLhG3L8I8tgDdngDTtBLQNGHRU/q+dvjd3EC0SATiK4aIbO2e2Xj9Xz+o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780426314;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=QS1+lWdfCdPK42+UyX4X/ZphgPLAdaSYGkCMqQkpa9w=;
	b=g2qDwrKET9UdJUSryBBzcxzKEHWaoXwwCk5poh6CMji4w+0+05eiIh1ZW3Ida+TS
	ohtTmNS7sD3hIuyFtncSWjpumuKOjuOqwWoPxw0gpOQnUFXezoHcfkom03MEWI3s3/k
	A2+tocveYu0gDY0TqoKSR4isy95xZjS/9MOckX/Yi9J02SiD6q6SVlCoyjWPoqTY4YK
	kj8pbreOb67Fd2S1QJWBGgxgSvzUSo5xr2JneP8zNCJ4Ob7/mkkHhO0/fMl+eq7GPYe
	S64iH32t96GEWyGdDoVVw0DZL/vFKCShvRIm2nZASGbv/tipQLlQUcq9cgVYKAcNDcR
	8QcDxO7XJQ==
Received: by mx.zohomail.com with SMTPS id 1780426311692339.73114776764294;
	Tue, 2 Jun 2026 11:51:51 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Wed, 03 Jun 2026 02:51:42 +0800
Subject: [PATCH] staging: sm750fb: Add missing Kconfig dependency
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-sm750-fb-iomem-kconfig-v1-1-7f6a3046cce2@rong.moe>
X-B4-Tracking: v=1; b=H4sIAD0mH2oC/yXMQQqDMBBA0avIrDtgwODgVUoXJp3YqSQpmSqCe
 PfGunyL/3dQLsIKQ7ND4VVUcqowtwb8a0wTozyrIRB1tjWMGnvbYnAoOXLE2ecUZELbk+mYDDk
 /Qo0/hYNs//H9cVkX92b/PW9wHD/hFUv8egAAAA==
X-Change-ID: f884501e-sm750-fb-iomem-kconfig-57814e818bca
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, 
 Teddy Wang <teddy.wang@siliconmotion.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Rong Zhang <i@rong.moe>
X-Mailer: b4 0.16-dev-d5d98
X-ZohoMailClient: External
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[rong.moe,none];
	R_DKIM_ALLOW(-0.20)[rong.moe:s=zmail2048];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7500-lists,linux-fbdev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sudipm.mukherjee@gmail.com,m:teddy.wang@siliconmotion.com,m:gregkh@linuxfoundation.org,m:javierm@redhat.com,m:tzimmermann@suse.de,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:i@rong.moe,m:sudipmmukherjee@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,siliconmotion.com,linuxfoundation.org,redhat.com,suse.de];
	FORGED_SENDER(0.00)[i@rong.moe,linux-fbdev@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[i@rong.moe,linux-fbdev@vger.kernel.org];
	DKIM_TRACE(0.00)[rong.moe:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-fbdev];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rong.moe:mid,rong.moe:dkim,rong.moe:from_mime,rong.moe:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 526C8631422

The sm750 frame buffer driver depends on FB_IOMEM_FOPS, but its Kconfig
somehow misses it.

Fix it by making FB_SM750 select FB_IOMEM_FOPS, as other frame buffer
drivers do.

Fixes: dc0ad215e5d8 ("staging/sm750fb: Initialize fb_ops with fbdev macros")
Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/staging/sm750fb/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/sm750fb/Kconfig b/drivers/staging/sm750fb/Kconfig
index 08bcccdd0f1c..25fe422f55f2 100644
--- a/drivers/staging/sm750fb/Kconfig
+++ b/drivers/staging/sm750fb/Kconfig
@@ -6,6 +6,7 @@ config FB_SM750
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
+	select FB_IOMEM_FOPS
 	help
 	  Frame buffer driver for the Silicon Motion SM750 chip
 	  with 2D acceleration and dual head support.

---
base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
change-id: f884501e-sm750-fb-iomem-kconfig-57814e818bca

Thanks,
Rong


