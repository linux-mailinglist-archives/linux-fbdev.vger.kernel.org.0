Return-Path: <linux-fbdev+bounces-6406-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BoRM3eto2kmJwUAu9opvQ
	(envelope-from <linux-fbdev+bounces-6406-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Sun, 01 Mar 2026 04:07:35 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E0B1CE3C3
	for <lists+linux-fbdev@lfdr.de>; Sun, 01 Mar 2026 04:07:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B34E305F667
	for <lists+linux-fbdev@lfdr.de>; Sun,  1 Mar 2026 01:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5CBA29B795;
	Sun,  1 Mar 2026 01:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L8lfwlvX"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C7321ABB9;
	Sun,  1 Mar 2026 01:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772330295; cv=none; b=uZWviga7hW2fg71dB9FKYzNZi6IY1hSka3kw9ejgn7GnMiBaI00uCQ8zUHo1OVSPIYZ2kFZ29BYGS8/OqYEUSsIMVBzFIBz7uq1zAub2EbVMSI+YCsawo5RVsRgV+02k1x6H3OGkY4hA/ZAaD/Hy/qHBgD2NF+rAPGCA0VRCCZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772330295; c=relaxed/simple;
	bh=wADx3ny5QdlcZD9mcMNhL5YrsN7Yc6RWZlAnpVzDePs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lRGINQYtUwcq7uAWGGrdwHLVbSUpDFL5OLKPharNtH2TX3O7AKEHBJ+/03Iw78AG0QZ+EhaohN1mjyHwJOhGI29WHrm4sxuhX2ER/C+jmIw2t59asmsuFEQ55N1tdBZuXdHKgF5lPswwHzE9kBWgTkdfrpH82LcVnKafg2TE4f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L8lfwlvX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD368C19421;
	Sun,  1 Mar 2026 01:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772330295;
	bh=wADx3ny5QdlcZD9mcMNhL5YrsN7Yc6RWZlAnpVzDePs=;
	h=From:To:Cc:Subject:Date:From;
	b=L8lfwlvXKdlRtb1jVn/s34JJfbLK2S2cFGhi+H6u0hPVOefDTimj2TP0pEUDfmYmc
	 zz4gb9P5cKMUvInmvf8swFYCgy6y/NcvIpsEmv9pcCj7NkBgrbYF4urXdmC1wkI/hY
	 R1VwDwW9iRekEd2ogFi2X2FeHGlJG1LiOmgO/kOLjGPTsdjPx/nb0H2BjPunL8cp2m
	 jSZ4deH6Xp6v1fdXw7VlIa+M8TjlxMsaz0VbyFAT3TdZJK/5Rb9bcfKMepylau5wZT
	 WMzqO8F+dYVked0cd/xAJPMHc4Sl+DYsUKlxOTYd9k39xdxk2RPLEP+XLgCYQ+lNiA
	 XpwDU57EZXPDg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	tzimmermann@suse.de
Cc: Helge Deller <deller@gmx.de>,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: FAILED: Patch "fbcon: Remove struct fbcon_display.inverse" failed to apply to 5.15-stable tree
Date: Sat, 28 Feb 2026 20:58:13 -0500
Message-ID: <20260301015813.1723622-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmx.de,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6406-lists,linux-fbdev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-fbdev@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,suse.de:email]
X-Rspamd-Queue-Id: 04E0B1CE3C3
X-Rspamd-Action: no action

The patch below does not apply to the 5.15-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 30baedeeeab524172abc0b58cb101e8df86b5be8 Mon Sep 17 00:00:00 2001
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Mon, 9 Feb 2026 17:15:43 +0100
Subject: [PATCH] fbcon: Remove struct fbcon_display.inverse

The field inverse in struct fbcon_display is unused. Remove it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: <stable@vger.kernel.org> # v6.0+
Signed-off-by: Helge Deller <deller@gmx.de>
---
 drivers/video/fbdev/core/fbcon.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbcon.h b/drivers/video/fbdev/core/fbcon.h
index 1cd10a7faab0f..fca14e9b729b9 100644
--- a/drivers/video/fbdev/core/fbcon.h
+++ b/drivers/video/fbdev/core/fbcon.h
@@ -30,7 +30,6 @@ struct fbcon_display {
 #ifdef CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
     u_short scrollmode;             /* Scroll Method, use fb_scrollmode() */
 #endif
-    u_short inverse;                /* != 0 text black on white as default */
     short yscroll;                  /* Hardware scrolling */
     int vrows;                      /* number of virtual rows */
     int cursor_shape;
-- 
2.51.0





