Return-Path: <linux-fbdev+bounces-4241-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2296FA84125
	for <lists+linux-fbdev@lfdr.de>; Thu, 10 Apr 2025 12:47:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 726E11B8084A
	for <lists+linux-fbdev@lfdr.de>; Thu, 10 Apr 2025 10:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BABF4256C75;
	Thu, 10 Apr 2025 10:47:29 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA9D21C170
	for <linux-fbdev@vger.kernel.org>; Thu, 10 Apr 2025 10:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744282049; cv=none; b=TkhqkRbxLR+g2Z1nnrJA12YkDVOXT7w/qyrhAWOaKVuRHtgz70RPJyKFuOB7ZG1vu3ehWblDDQfLpfjd+VwgcpZUL1ps6qdzS/dTeHNH277DlFJ2ypmdU4HLQko0onhKVjS30bVSJW5EpuSDqp1s55wZY4C+x3svDa+rHJQ2hck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744282049; c=relaxed/simple;
	bh=7zv0IjhXNzKmOok7B90KSMLM/qIH1bGHaQDDM1g854c=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=THTvwqG/0tUWMEsQUDX5lVnPpq8SBGQwVRBp5+fpYsrte2dKoW1xZVc7zAgSaF/owRDc5FnTUdhIzAmE9RUwGcwNw1RtQT5p4i2g5gebgIfeSNQ36G5oRen1JTb2sG3CGkthrmy7yPEtgepZdSF/oBSlww5kDnlqPhhFryWhsbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d5d6c997d2so6877135ab.0
        for <linux-fbdev@vger.kernel.org>; Thu, 10 Apr 2025 03:47:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744282047; x=1744886847;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AlTWe7lPsGw31nuXM8chVWl1bx2tUtkForMg0W0gSgk=;
        b=m3/u4lm8O1V3iCpBD61u2Bo32u7ExkjZFsHrxv8VYv7NUa1GKFHWqsBRmQ2EcyYtZL
         1PC7ej699vFeADILfq3UvANLeCw1Vk2fH69Y8wwJorUDps8wC0xdiPLjZH9+6qwmDwp2
         QNvANbpEgpAzPoDUogiF9008eUL0bjWf0kJ4hv0s57seozy8zSDkOKwU7G/UySO6/rFJ
         c3+HKQl0vxBymgfgQopfwN8/DtVBt/E65/pgBIlkDT3F63ObNKAypcZWFGqXxRTrWSLy
         q7t5GXmttZUTZpsCoK/qUcIf5M5kwVY3PnWcMtDqb9uiKC+8kLEfcc0DE1rGB5Lemo1F
         u9ew==
X-Forwarded-Encrypted: i=1; AJvYcCWz/EZ72MeFmHEgLqKvkrP3p4M0277oEEFYYf0LtNNiQDJmgcQhbvU4z10BHplC0O1I7qahIlxVyhl0Jg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVQYLKTR0I5chAebjlWMWjxb4SLH8OW3mUqRxLuTxYPxTZVcHi
	grgS3TB5G25IuMj5CfMXagkep7Dv3vRiofVsSYOmQtKpULiq74sBZ+DupELb6w7BCf3ef5/5+4e
	8TJvwM50ydZbStTiMQk/b/AU5ve5mKF9MAitjak7QBwZfj9+O8Uc23aU=
X-Google-Smtp-Source: AGHT+IHjlwJZZdP9uaIUa3mFoLVyCXxsGN/30yQx65nP8833D2MI5lVc6QRZxHZHUwjbdB5VTVJfQZZFFkFzmOy9nV0tTPKS766B
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3c86:b0:3d4:36c3:7fe3 with SMTP id
 e9e14a558f8ab-3d7e46f8e7bmr21247925ab.9.1744282047171; Thu, 10 Apr 2025
 03:47:27 -0700 (PDT)
Date: Thu, 10 Apr 2025 03:47:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f7a1bf.050a0220.258fea.002c.GAE@google.com>
Subject: [syzbot] Monthly fbdev report (Apr 2025)
From: syzbot <syzbot+list6acef4c48c6bb189b56e@syzkaller.appspotmail.com>
To: deller@gmx.de, dri-devel@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello fbdev maintainers/developers,

This is a 31-day syzbot report for the fbdev subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/fbdev

During the period, 0 new issues were detected and 0 were fixed.
In total, 6 issues are still open and 25 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 1136    Yes   KASAN: vmalloc-out-of-bounds Write in imageblit (4)
                  https://syzkaller.appspot.com/bug?extid=c4b7aa0513823e2ea880
<2> 42      Yes   KASAN: slab-out-of-bounds Read in fbcon_prepare_logo
                  https://syzkaller.appspot.com/bug?extid=0c815b25cdb3678e7083
<3> 17      Yes   KASAN: global-out-of-bounds Read in bit_putcs (3)
                  https://syzkaller.appspot.com/bug?extid=793cf822d213be1a74f2

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

