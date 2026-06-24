Return-Path: <linux-fbdev+bounces-7710-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DU0iDBdIPGqEmAgAu9opvQ
	(envelope-from <linux-fbdev+bounces-7710-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Wed, 24 Jun 2026 23:11:51 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A696C160E
	for <lists+linux-fbdev@lfdr.de>; Wed, 24 Jun 2026 23:11:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=fastmail.org header.s=fm1 header.b="MFBx5/t3";
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="a XKg3ZQ";
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7710-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7710-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=fastmail.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7BB80300576D
	for <lists+linux-fbdev@lfdr.de>; Wed, 24 Jun 2026 21:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9DB73D1CCA;
	Wed, 24 Jun 2026 21:11:41 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from flow-a3-smtp.messagingengine.com (flow-a3-smtp.messagingengine.com [103.168.172.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2259332601;
	Wed, 24 Jun 2026 21:11:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782335501; cv=none; b=KVP4AKyqIw/oJ3MZ3rvdmrjO2FrtMaTqd2X3HSKubk/0wI7vOGirt9458mvx8eHnBLbKlSZYjmZyPd4D5wqD8GM87F70EljqRTF9Umt8Y/8/8p4nlTIvjRV0BH8w47f70SQDKOt5wXn+dcWmKiY/wJAgmLiscelPAopiGQpDaXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782335501; c=relaxed/simple;
	bh=zld49VFo9D4gahRzAqq5D+oUQbNLIsgSUErbnTiM04o=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iOAiUbMZZfdIhLR40wAikDCqMuI5LgqfpBfMY/Yy26ufiHeGbkwze4wzq0VRtUY9PLPpvUoDaMjysIbAJAEGsY8U7Jvq6/aGeYRqyjVOzVsFa1j3zBW9l4zsWmWkSd+5jaSv9KpvbuoL4BSiseFQ6figYBJncUmO8SAHvy2qHDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org; spf=pass smtp.mailfrom=fastmail.org; dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b=MFBx5/t3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=aXKg3ZQb; arc=none smtp.client-ip=103.168.172.138
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailflow.phl.internal (Postfix) with ESMTP id C546313806D7;
	Wed, 24 Jun 2026 17:11:38 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Wed, 24 Jun 2026 17:11:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm1;
	 t=1782335498; x=1782339098; bh=HLvIbEEh4LRcXndYsesxCx6snQfBdL+u
	rW4VdjcGabI=; b=MFBx5/t3bDYp1v4eLJ0wdxfgxFFCywm49fVzIiIfFZm1nPJ7
	vuxMwsb/CdAYXSB8O/7pJJitubIPZx+IaQXiPrPUwft/oT1Km6e4EWrBx1gMFb7J
	IOQM11kK7keQfklGc7/eOAw3hdPaAx5zZ0Qaekzl8wkyATwsgGi3pEmFMyVdf7p5
	r6cmanEsPcHr1bzwUpnE5Qo09R3kCXg7Zl05BDK4k5hVZhuP8Ifv7vXTDZSiBu/y
	6yzf05RbMT8n/BxWEvF5NsEIjUwYUZ11rew7rCKe9K/l0W9dp3YREnO8/ZGc4rGA
	vn97VYGLJsQan4UtCpLbaDmcBrlI3xYMzR3IqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1782335498; x=
	1782339098; bh=HLvIbEEh4LRcXndYsesxCx6snQfBdL+urW4VdjcGabI=; b=a
	XKg3ZQbnXTZwQRCFg2XqvVo6IBgR0dkKRqheaJKiI5UNhsyf9+ZqCUO1+Nsv3Psj
	JC3jUSisdi9Wrf9glUBy+uauWNge1ciFpAyifOUA5cd73QFe/IjiqRj1b2PLsHtm
	GCIupW9p1HXinriB6DVSvOYsI+ffBYT9bjSJbinLV3Y5sdk8qliDawglKRvbG9gv
	uABoubV4sYPiO8LtE2x0ptZE+enrOfeK+OaiHxJ2JawMNUj6U8pELp2aeOziaKO1
	tHCQBFlc8t9uGitA6zbuKLznx8tbxaey3ZkSe/tBVBOVCjBUoqlxiHxJNVSFjR9V
	NmXsnQCim0lK2qiHyKkMw==
X-ME-Sender: <xms:Ckg8aibLDL6qVcZMY67fHExBIFJPLCKOGe1F3PpFUfj_dEmV4j410Q>
    <xme:Ckg8agXCLjRKQZvmYlOm1KoIzk7Q16XVvWTj6NY-2KVb3bTuzpUaHjr3736zm_Vqz
    pRYb6Bqm6FWSdgItMeOLOvXfLitULafP2kyf0wg5BGN9I88l0OWJyZ6>
X-ME-Received: <xmr:Ckg8ar-Q3XoSIX-QVEXeo9mVKqCyMRD2NJmeD8l6BxwHDlc4LKEX9jsXLiA>
X-ME-Proxy-Cause: dmFkZTEoJUJZAbIrMiuSeodSbMwEfc4MOjLc8W4PcGDO69zM/tp1kxpSFKNl05EZ+oYspp
    9s5vDWghVzHBTnV+6rRNv2VDSyt8wl9UPm9OTDQPsenMFy4zHsUa6UijWeXrH/MFHm6z/T
    kDtDDwk7nXVSNYBpHua5sIQYeN9Pu6vaXlyfA1RSmY1DoXmA823EcoLjVZ0IrVaSgkbKc4
    cn2HD3hK3axHZi0AKBEuquYDzX9JY+BAC05NcRLYkoqjtMQsycOBmFS6pu3k5cyuNkk6Og
    zFzFWJQzGuFlLbMdLWYiC4RhWzrhzOk6TyRD04nrUyE4IgGNQpRzTG3jTNUCOKhnaL4zWs
    Z5LPENRPZAOQTb5hw/zUecu+URwE4BDoM/Fx5UBZC7e90eeKAF6ODKWBjbrNw3M3AT9iiK
    8D8ONuTAF3XmDbXg4yB1WlpBWXwCIHrmStOHwMlV8rnFxcBRlUDiawY7pFdgOBjxYGs+R8
    mTNEphw6ts8io0Mny1EFp+R/gMGOt9/G7BGvuAQtBBKJif7lV4vtS7V6tVKQkDMPjCrDUl
    PhH7/aLTFvmEsCNPrGGP2qP0gK2XyJqjiQztDPJ1A0yKszDWGmQizFbq9CK5O19M2gjqe8
    jO5b1kDzPJ9W6tD/CiedCHnrZK7lesyygYeO11MxQmw4nYy91k4sA+CfdMVQ
X-ME-Proxy: <xmx:Ckg8ap8_RHHF5hchWpNVSuTF3MupdNfvB9FlMZue9FMuk5Yjx8LNLA>
    <xmx:Ckg8arTMD_9uxo6uSofBVVHF8zKHVx2_dTL-E2K_UzPLaUep8NYPNA>
    <xmx:Ckg8atdOQygom_5CoLGH5KEZUuPlXYdw83WlY-iwzgRVrMOo6P6Zhw>
    <xmx:Ckg8avCPZgWj3Pj3Q7U-O14oD6-9UmWDmFevBMfjtO-J-eAZDFqslw>
    <xmx:Ckg8atCKT2eaGq88AfJqwn6JbCiFq0RwZUaPRj9vSRZOSzLfNXgt_62A>
Feedback-ID: ib53e4b78:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 24 Jun 2026 17:11:37 -0400 (EDT)
Date: Wed, 24 Jun 2026 16:11:36 -0500
From: Ian Bridges <icb@fastmail.org>
To: Helge Deller <deller@gmx.de>, Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] fbcon: fix NULL pointer dereference for a console without
 vc_data
Message-ID: <ajxICA0v-_5NrqhS@dev>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[fastmail.org,none];
	R_DKIM_ALLOW(-0.20)[fastmail.org:s=fm1,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmx.de,suse.de,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:deller@gmx.de,m:tzimmermann@suse.de,m:simona@ffwll.ch,m:dri-devel@lists.freedesktop.org,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[icb@fastmail.org,linux-fbdev@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-7710-lists,linux-fbdev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[icb@fastmail.org,linux-fbdev@vger.kernel.org];
	DKIM_TRACE(0.00)[fastmail.org:+,messagingengine.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fastmail.org:dkim,fastmail.org:email,fastmail.org:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,dev:mid,messagingengine.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 84A696C160E

fbcon_new_modelist() runs when a framebuffer's modelist changes. For each
console mapped to it with fb_display[i].mode set, it reads vc_cons[i].d and
passes the vc_num to fbcon_set_disp(). This assumes a console with a mode
set has a vc_data, but it can be NULL. fbcon_set_disp() sets
fb_display[i].mode before it checks vc_data, and fbcon_deinit() leaves the
mode set after the vc_data is freed. fbcon_new_modelist() then dereferences
the NULL vc_data.

Keep fb_display[i].mode set only while the console has a vc_data. Check
vc_data before setting the mode in fbcon_set_disp(), and clear the mode in
fbcon_deinit(). The existing mode check in fbcon_new_modelist() then skips
such consoles.

Reported-by: syzbot+42525d636f430fd5d983@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=42525d636f430fd5d983
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Ian Bridges <icb@fastmail.org>
---
This patch fixes a NULL pointer dereference in the framebuffer console code.
fbcon_new_modelist() dereferences a NULL vc_data. It was found while writing
a reproducer for a separate use-after-free in store_modes(). Sashiko
independently flagged the same dereference in its review of the fix for that
use-after-free [1].

The dereference happens when a console has fb_display[i].mode set but no
vc_data, and the modelist is then replaced, as follows.

1. A console ends up with fb_display[i].mode set while vc_cons[i].d is NULL.
   Either fbcon_set_disp() sets the mode (fbcon.c:1446) before it checks
   vc_data, so mapping an unused console with FBIOPUT_CON2FBMAP leaves the
   mode set, or fbcon_deinit() (fbcon.c:1268) frees the vc_data but keeps the
   mode.
2. A write to the modes attribute calls store_modes() (fbsysfs.c:91), which
   replaces the modelist and calls fb_new_modelist() (fbsysfs.c:108).
3. fb_new_modelist() calls fbcon_new_modelist() (fbmem.c:770).
4. fbcon_new_modelist() walks the consoles mapped to the framebuffer, takes
   vc = vc_cons[i].d for the one with the mode set, and reads vc->vc_num with
   vc NULL (fbcon.c:3046). This is a NULL pointer dereference.

This patch does not change that line:

    fbcon_set_disp(info, &var, vc->vc_num);

vc is vc_cons[i].d, which is NULL.

syzbot reported the same crash, with the call stack store_modes() ->
fb_new_modelist() -> fbcon_new_modelist() [2]. That report had no reproducer
and was closed as obsolete.

It reproduces on a KASAN kernel with two framebuffers, two ways:

1. Map an unused console to one framebuffer and back to the other with
   FBIOPUT_CON2FBMAP, then write a modelist to that framebuffer's modes
   attribute.
2. Open and close /dev/ttyN, then write a modelist to its framebuffer's
   modes attribute.

The reproducer was written with the help of a coding agent (Claude Code). The
patch is against commit 3726ce7f6cef on the for-next branch of
git://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git. The
file offsets above are from that commit. The dereference is present in the
initial 2.6.12-rc2 import, so there is no Fixes tag.

[1] https://lore.kernel.org/all/20260622080749.D7FC61F000E9@smtp.kernel.org/
[2] https://syzkaller.appspot.com/bug?extid=42525d636f430fd5d983

 drivers/video/fbdev/core/fbcon.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 9077d3b99357..97d4b836b26a 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -1273,6 +1273,7 @@ static void fbcon_deinit(struct vc_data *vc)
 	int idx;
 
 	fbcon_free_font(p);
+	p->mode = NULL;
 	idx = con2fb_map[vc->vc_num];
 
 	if (idx == -1)
@@ -1443,14 +1444,14 @@ static void fbcon_set_disp(struct fb_info *info, struct fb_var_screeninfo *var,
 
 	p = &fb_display[unit];
 
-	if (var_to_display(p, var, info))
-		return;
-
 	vc = vc_cons[unit].d;
 
 	if (!vc)
 		return;
 
+	if (var_to_display(p, var, info))
+		return;
+
 	default_mode = vc->vc_display_fg;
 	svc = *default_mode;
 	t = &fb_display[svc->vc_num];
-- 
2.47.3


