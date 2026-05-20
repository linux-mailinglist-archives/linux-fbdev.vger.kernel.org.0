Return-Path: <linux-fbdev+bounces-7320-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNIxBPepDWpr1AUAu9opvQ
	(envelope-from <linux-fbdev+bounces-7320-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Wed, 20 May 2026 14:32:55 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C3158DB9E
	for <lists+linux-fbdev@lfdr.de>; Wed, 20 May 2026 14:32:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BEE87300462B
	for <lists+linux-fbdev@lfdr.de>; Wed, 20 May 2026 12:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74F533DD53B;
	Wed, 20 May 2026 12:32:48 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1554133A033
	for <linux-fbdev@vger.kernel.org>; Wed, 20 May 2026 12:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779280368; cv=none; b=sEErYp52z0KR088ocP8GrHuCkOJA5SXqxuhfYW72NkYvHALg64J/Gc0lg09SbCWl/JWqzknUjeMXqc1gACkP3CNvFIwEKsth4RQqIBCy1a1zw7TUJeAoZXPzgwcK4q4RNKZi8teHQZnXR02jtW6KlxlTktECWHrCIJorC+ccn6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779280368; c=relaxed/simple;
	bh=zWFebkPkyBuYoXPnkQCGPFv9zsWkRSxDMWEuk0rfPf0=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=iO+rk6G2y1YGCuRogWEbnXB4Zp+cuXkjiu7+sNsPFEJCz7iFQpMbOP/tlGUHzhmb8v2rWxj+IFfcdv1TD75tnSCpXUqyQ1CHYEqyXlhBJD1Bqo8G2lH+xdZ47QYH2ZwZEtd/5kclonZc9S1bxMvK3gD3gMS/Lb4GSr/B5nr68VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-439be67c0c2so5359338fac.2
        for <linux-fbdev@vger.kernel.org>; Wed, 20 May 2026 05:32:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779280366; x=1779885166;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5TC7lSyjrD13LRclT9+bptPhmnvLezFlV6rbC6PKVOE=;
        b=ZzTMrQazcpSTYF+6uZxX6KNUBRSh7BXC4lk9RWeFK7P2p/mIuWX53Cb+NHjIIQt7x9
         hyMcBX/xuklvkjtuLZn4ay+b08It+Q1UCbxWbebJl+scwl7QPFRnFcupHtGK3CpLSqGE
         yKyz+B/U6vVDLYhHzik3TxaTMRcZI8clIQH2WnFURoj7GPOxlp//jqTyAA9HqRIPuf9u
         Fgaak+LzvKJQAoYmC0kqyJY7OJQhZEtGVRudkVvEPaLAPGPwYh0PadL03YM4tGczEEXf
         hwS7P6n1zxLTDJxWjncj91IOJRv3DzzjMtX9NclsDENaAw6D4W+zMzbVL5KcFEm9fRjC
         8qCw==
X-Forwarded-Encrypted: i=1; AFNElJ/c54ChgowSN7GzhwjMA5lK8BoJQ/wrzpram9C94C3I2M3YkexIDOUlAAZZHWpm2945LXVSR11APVM9Yw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVPxAVuHWV+RleAiAVxzPYcvT0rX2RSiAnkOwJghz9Z3JUNZVk
	LO9oaQFGXU9p35f1m+ngtIvgga/lwNh/tAhgZBHVto7NP8OFXdIwtkVu5/4WpDF5OFZgHfZqmmQ
	3sZBeb2Sl5hkxnnnu74ce9KP7Epumveli4Hj1aoUa9wr93Ox/3V8SLeewi9Y=
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:3103:b0:69b:5486:e85 with SMTP id
 006d021491bc7-69c9bfd479emr14642792eaf.36.1779280366120; Wed, 20 May 2026
 05:32:46 -0700 (PDT)
Date: Wed, 20 May 2026 05:32:46 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a0da9ee.170a0220.1f6c2d.0009.GAE@google.com>
Subject: [syzbot] Monthly fbdev report (May 2026)
From: syzbot <syzbot+list6f29fe22f06f2b7fbccd@syzkaller.appspotmail.com>
To: deller@gmx.de, dri-devel@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7320-lists,linux-fbdev=lfdr.de,list6f29fe22f06f2b7fbccd];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmx.de,lists.freedesktop.org,vger.kernel.org,googlegroups.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-fbdev@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-fbdev];
	R_DKIM_NA(0.00)[];
	REDIRECTOR_URL(0.00)[goo.gl];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,syzkaller.appspot.com:url,googlegroups.com:email,goo.gl:url]
X-Rspamd-Queue-Id: E4C3158DB9E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello fbdev maintainers/developers,

This is a 31-day syzbot report for the fbdev subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/fbdev

During the period, 0 new issues were detected and 0 were fixed.
In total, 4 issues are still open and 29 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 4265    Yes   KASAN: vmalloc-out-of-bounds Write in imageblit (6)
                  https://syzkaller.appspot.com/bug?extid=5a40432dfe8f86ee657a
<2> 1591    Yes   KASAN: slab-out-of-bounds Read in fbcon_prepare_logo
                  https://syzkaller.appspot.com/bug?extid=0c815b25cdb3678e7083
<3> 258     No    KASAN: vmalloc-out-of-bounds Write in fillrect
                  https://syzkaller.appspot.com/bug?extid=7a63ce155648954e749b

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

