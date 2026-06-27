Return-Path: <linux-fbdev+bounces-7753-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UynnIK8NQGrYbQkAu9opvQ
	(envelope-from <linux-fbdev+bounces-7753-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Sat, 27 Jun 2026 19:51:43 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D456D2714
	for <lists+linux-fbdev@lfdr.de>; Sat, 27 Jun 2026 19:51:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=TgKDEKhw;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7753-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7753-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 250C130177AE
	for <lists+linux-fbdev@lfdr.de>; Sat, 27 Jun 2026 17:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A864533F38A;
	Sat, 27 Jun 2026 17:50:29 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924E223AB87;
	Sat, 27 Jun 2026 17:50:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782582629; cv=none; b=cPZ0ZDYffWvR1j89//b7G3Ke+p6PJA6LOmH9zp72VpGh0eVRlVcChIJAIfEoN5E4fWi7sc+/DMo4tcpiTmqrApXD6+XFYjal1ci4O9niQOH2HpWb8ihnud3l3TC8gkVok62UTBdovzzvg2lJS4f3AZ4c/gSV/f0CsFPrZOEM0yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782582629; c=relaxed/simple;
	bh=b38HCn1KAyh/kKfP9bJKDcZHlr0Y8UJTU5dL2gHkFLQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pPIrxWL9eozvcDaD3MttxZeYJ1CgDHp5vlICG/ARS7chk6m7K6K8sXqrTgc4nr42KMDJNMTmK3TvSjW3HVRYGvCa3SNQwzg8B5SNtyclyuTU6PC5hNGan3VmqPH4cxUJZzv62HRTnVES5p42cJuvRS3sLoEgTgH/64POexL1GwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TgKDEKhw; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC2991F000E9;
	Sat, 27 Jun 2026 17:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782582628;
	bh=TcA5077Fg50GxF9pJDTFxugH2HQC+j8KYXX8dfnXUk8=;
	h=Date:From:To:Subject;
	b=TgKDEKhwZXMypoWehkfq4m2pnu9/J8xbiENBChcSGfSenc1bAfNuGmOd4InvrsUUu
	 NEAMC3PTD0pZv0TFRiE7XuiTE2jLQtjVl73aX+F7pNNRxOaSohmF11NOP3HQxl+Mbd
	 8ZnCoflT3TzSe6DM8dKFWypDmtP6f4EYndGpy99C15QOXViQ6N/BMIjIy700K6qX/9
	 iRygKczHBzNTSarmpLKhqZ9Xk5jAmRjEtaQ7zfV4+6vCJUqZI6sGCMIQ+oCz9iZ4e3
	 VjUFD/VJd41k8uZSD0VNJPkhhHr7Bkqkoi+CO95sBl4n597Hx5uaeZOFsYJFz9WFqD
	 /irQDOPbxllCg==
Date: Sat, 27 Jun 2026 19:50:23 +0200
From: Helge Deller <deller@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [GIT PULL] additional fbdev fixes and updates for v7.2-rc1
Message-ID: <akANXx5Fr4vBRhwg@carbonx1>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7753-lists,linux-fbdev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[deller@kernel.org,linux-fbdev@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:dri-devel@lists.freedesktop.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deller@kernel.org,linux-fbdev@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D8D456D2714

Hi Linus,

please pull the second half of fbdev fixes for this merge window:

Two patches for generic fbdev & fbcon code which fixes the handling of
modelists and prevents a potential NULL ptr dereference in the console code.

Five patches fix various missed cleanups in the error path of various fbdev
drivers.

And Uwe Kleine-König contributed one cleanup patch to use named initializers
in the vga16fb driver.

Thanks!
Helge

----------------------------------------------------------------

The following changes since commit 4708cac0e22cfd217f48f7cec3c35e5922efcccd:

  Merge tag 'staging-7.2-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging (2026-06-22 12:43:16 -0700)

are available in the Git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-7.2-rc1-2

for you to fetch changes up to 7f08fc10fa3d3366dc3af723970bd03d7d6d10e3:

  fbdev: Fix fb_new_modelist to prevent null-ptr-deref in fb_videomode_to_var (2026-06-26 15:12:45 +0200)

----------------------------------------------------------------
additional fbdev fixes & cleanups for 7.2-rc1:

Fixes:
- fbcon: fix NULL pointer dereference for a console without vc_data [Ian Bridges]
- fbdev: fix fb_new_modelist to prevent null-ptr-deref in fb_videomode_to_var [Ian Bridges]

Fixes in failure paths:
- pm2fb: unwind write-cache setting on probe failure [Haoxiang Li]
- goldfishfb: fail pan display on base-update timeout [Pengpeng Hou]
- viafb: return error on DMA copy time-out [Pengpeng Hou]
- fbcon: fix out-of-bounds read in error path of fbcon_do_set_font() [Mingyu Wang]
- fbdev: fix modelist use-after-free in store_modes() [Ian Bridges]

Code cleanup:
- vga16fb: clean up platform_device_id table [Uwe Kleine-König]

----------------------------------------------------------------
Haoxiang Li (1):
      fbdev: pm2fb: unwind WC setup on probe failure

Ian Bridges (3):
      fbdev: fix use-after-free in store_modes()
      fbcon: fix NULL pointer dereference for a console without vc_data
      fbdev: Fix fb_new_modelist to prevent null-ptr-deref in fb_videomode_to_var

Mingyu Wang (1):
      fbdev: fbcon: fix out-of-bounds read in err_out of fbcon_do_set_font()

Pengpeng Hou (2):
      fbdev: goldfishfb: fail pan display on base-update timeout
      fbdev: viafb: return an error when DMA copy times out

Uwe Kleine-König (1):
      fbdev: vga16fb: Drop unused assignment of platform_device_id driver data

 drivers/video/fbdev/core/fbcon.c   | 14 +++++++++++---
 drivers/video/fbdev/core/fbmem.c   | 12 ++++++++++++
 drivers/video/fbdev/core/fbsysfs.c | 10 +++++++++-
 drivers/video/fbdev/goldfishfb.c   | 13 +++++++++----
 drivers/video/fbdev/pm2fb.c        |  1 +
 drivers/video/fbdev/vga16fb.c      |  4 ++--
 drivers/video/fbdev/via/via-core.c |  7 +++++--
 7 files changed, 49 insertions(+), 12 deletions(-)

