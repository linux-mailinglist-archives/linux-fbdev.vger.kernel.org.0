Return-Path: <linux-fbdev+bounces-6383-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IH2zDjqvoWk3vgQAu9opvQ
	(envelope-from <linux-fbdev+bounces-6383-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Fri, 27 Feb 2026 15:50:34 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84ECD1B93BE
	for <lists+linux-fbdev@lfdr.de>; Fri, 27 Feb 2026 15:50:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 95C553021971
	for <lists+linux-fbdev@lfdr.de>; Fri, 27 Feb 2026 14:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A804742668D;
	Fri, 27 Feb 2026 14:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="Rv8OEENH"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7657E305E28;
	Fri, 27 Feb 2026 14:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772203824; cv=none; b=dimJJSX1wi0HM+7+yR78qhTtnIWQEehF4C5lN4rgKXLUAvqAEuzlOOBuNuvP/DTI/5BKpTr57CoQ/6NPAoAFrrUmTYPW6C5MzIDPYkx2EXkaynyIw9d/10m99XvXaVx+OD1m97NKvbXUEnZS6Uqo7+HC3nh6ROS9ZLIujcYx+Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772203824; c=relaxed/simple;
	bh=wjGS3JYYDcQOBF23+wDOSZc4bk+nsa7akfzKx6SHQk4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ah5303y0/vyz304lPezqrOem5h8DBupwhBys3dbqZOmnNYKMXF3wjfmFGWSKCtSV6BZriVsS+ABD5rniBsSoxzW+hpM2/ovVPQt3TjNBRJrACLyhSt8ahS7oQKMApwaybfWQJFraXJWxCrp4QxJbAhODWTjJCMaXIaAXuDpeevM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=Rv8OEENH; arc=none smtp.client-ip=113.46.200.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=AZywAH3WYbkR9PO65C7IcuLmmSt8ImR+Ev0Nk5bEyYY=;
	b=Rv8OEENHUDY8bt6ICFPMCKMEqD0hVX3CIr65lZmv0xdoOwCYf6+g72K0X9bfvpUzWWSeUVZMe
	9R/mlo1nEqQE1aNcN6YW3kMFzq6Aba5ZZlFqUTOF76FGdh26FfDynb5fJljkpFfO5+1cxetx5av
	/EJ02TxdNTD5sAehfYZ/eLk=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4fMrj546fTzmVXR;
	Fri, 27 Feb 2026 22:45:29 +0800 (CST)
Received: from dggpemf100008.china.huawei.com (unknown [7.185.36.138])
	by mail.maildlp.com (Postfix) with ESMTPS id B7E8340562;
	Fri, 27 Feb 2026 22:50:18 +0800 (CST)
Received: from mdc.huawei.com (10.50.87.204) by dggpemf100008.china.huawei.com
 (7.185.36.138) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 27 Feb
 2026 22:50:18 +0800
From: Chen Jun <chenjun102@huawei.com>
To: <simona@ffwll.ch>, <deller@gmx.de>, <tzimmermann@suse.de>,
	<linux-fbdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <chenjun102@huawei.com>, <linruifeng4@huawei.com>
Subject: [RFC PATCH] fbcon: Fix out-of-bounds memory in fbcon_putcs
Date: Fri, 27 Feb 2026 22:43:58 +0800
Message-ID: <20260227144358.101173-1-chenjun102@huawei.com>
X-Mailer: git-send-email 2.22.0
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf100008.china.huawei.com (7.185.36.138)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[chenjun102@huawei.com,linux-fbdev@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-6383-lists,linux-fbdev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[ffwll.ch,gmx.de,suse.de,vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	RCVD_COUNT_FIVE(0.00)[6];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,huawei.com:mid,huawei.com:dkim,huawei.com:email]
X-Rspamd-Queue-Id: 84ECD1B93BE
X-Rspamd-Action: no action

When a font is set on an invisible console, the screen will not update.
However, the fontbuffer is not updated to match the new font dimensions.

This inconsistency leads to out-of-bounds memory access when writing to
the tty bound to fbcon, as demonstrated by the following KASAN report:

BUG: KASAN: slab-out-of-bounds in fb_pad_aligned_buffer+0xdf/0x140
Read of size 1 at addr ffff8881195a2280 by task a.out/971
Call Trace:
 <TASK>
 fb_pad_aligned_buffer+0xdf/0x140
 ud_putcs+0x88a/0xde0
 fbcon_putcs+0x319/0x430
 do_update_region+0x23c/0x3b0
 do_con_write+0x225c/0x67f0
 con_write+0xe/0x30
 n_tty_write+0x4b5/0xff0
 file_tty_write.isra.41+0x46c/0x880
 vfs_write+0x868/0xd60
 ksys_write+0xf2/0x1d0
 do_syscall_64+0xfa/0x570

Fix this by calling fbcon_rotate_font() if vc is invisible in
fbcon_do_set_font().

Signed-off-by: Chen Jun <chenjun102@huawei.com>
---
 drivers/video/fbdev/core/fbcon.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 666261ae59d8..d76100188bee 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2444,6 +2444,11 @@ static int fbcon_do_set_font(struct vc_data *vc, int w, int h, int charcount,
 		rows = FBCON_SWAP(par->rotate, info->var.yres, info->var.xres);
 		cols /= w;
 		rows /= h;
+		if (!con_is_visible(vc)) {
+			ret = fbcon_rotate_font(info, vc);
+			if (ret)
+				goto err_out;
+		}
 		ret = vc_resize(vc, cols, rows);
 		if (ret)
 			goto err_out;
-- 
2.22.0


