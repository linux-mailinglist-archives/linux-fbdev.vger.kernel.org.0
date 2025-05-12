Return-Path: <linux-fbdev+bounces-4344-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1D8AB2FB0
	for <lists+linux-fbdev@lfdr.de>; Mon, 12 May 2025 08:34:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE9F6178DEB
	for <lists+linux-fbdev@lfdr.de>; Mon, 12 May 2025 06:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0F71255F3E;
	Mon, 12 May 2025 06:34:23 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6F62550AE
	for <linux-fbdev@vger.kernel.org>; Mon, 12 May 2025 06:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747031663; cv=none; b=GG6Esi4z5JNZEoYglg+NwDupZtd88t6iL3rOHAaeyiW77RTzWgUe1+k07Dj4BC2eX6D+ytRkt7wYUysOPP7SDgVAHd/SHzhm4unEpz0lhLsw6VcJiufZ7lHVNeF/aIoRFIwVyiVX7n01POjwpgyuLLZSVoKvbFJGVZ5SASM6nKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747031663; c=relaxed/simple;
	bh=4hTnCJZKbc6IzowhXTEn7o+qQ+7Igw0KCzxnMJkeNsE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=PPB733H4xRr3IGh3G61dp/xKJgCX5IKzJ4fYhCGBYvhnHaREchCDSR1hd3JSbfgqRYC3TyvjZUkbHr+pCGCQietDBaPh0Dca0MxekNgAmXhW88Gpgp8aKnUgr/Vo0IBLEoIwCAk9NT7jIwavHh2c1Or10M63YzPAzoiPrNZn/kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-86734b96d7aso473851039f.0
        for <linux-fbdev@vger.kernel.org>; Sun, 11 May 2025 23:34:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747031661; x=1747636461;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aY4YPekFezEFOenoNv7QvnHL9ecGgH1YuNNn9+bqEQM=;
        b=Ncw8xmMq4a8g1UlknqRmOSZ+92JB9SmuA46fsRKkiMMVgPW/qfhv00Bfx9VrTiF+0H
         muJVqQsYgUz7QV8i6lnqA79SjvgmbzKGF8HhfxDozTrFjCjWF9MOW3rNS3e/V7IqRyQ5
         WV+q+kN7O321eSKVO3lsahFFDmKEY2eqZi+n6GvgBV1XjpsxtUxpOl2/e1fPIwFjfBom
         liiwbGfGnqs+psywhH3GvHvra8QrmEsRCAx/eHFx5jwAZfwgt3evoBEdTNHvFKAYCX4g
         O45bprdSxVfR6kN2CXfHYDjbAFnjAnzq2c6FyICo9n9tcjwOanteQ6DtWKRakFhBE4nU
         NFng==
X-Forwarded-Encrypted: i=1; AJvYcCVyHNdbsVDz1P5cSCSEwwNqMqVOJldN2TvnoxoG5+NIY8S3ERD8L+a4aPBl2pHKd9sHiEz8nAnnTwL+vg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiFacO5GlTVLhAtQXGsYP1WIlz5a/6LnlbhX4oqvzr7IiBEzAh
	umAZpIBbDdyFnc3Fu6w7/q0WX6xyXiCnb4Or7gcwwgvZ0iiGSIxpYPwXwNTEbKYSoGyARt7Ci/2
	TuMrc7HaouUiAn4aaGREAI5o0uzJ9CgnDlg7Pzrn18jtUXDTa/is8Jlw=
X-Google-Smtp-Source: AGHT+IE/gq9tU8dDX0ASPqGXpdsRLrai6u1l1DaPlmIX4+KOGGG7M7zAz8Nc88V/zx5bwevHNOlj5Q/7zqSuQmQo1RVVNZ6/iRgI
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3fca:b0:867:16f4:5254 with SMTP id
 ca18e2360f4ac-8676445406dmr1255531439f.6.1747031661405; Sun, 11 May 2025
 23:34:21 -0700 (PDT)
Date: Sun, 11 May 2025 23:34:21 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6821966d.050a0220.f2294.0051.GAE@google.com>
Subject: [syzbot] Monthly fbdev report (May 2025)
From: syzbot <syzbot+listee2134ca234fc0c46f91@syzkaller.appspotmail.com>
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
<1> 1393    Yes   KASAN: vmalloc-out-of-bounds Write in imageblit (4)
                  https://syzkaller.appspot.com/bug?extid=c4b7aa0513823e2ea880
<2> 123     Yes   KASAN: slab-out-of-bounds Read in fbcon_prepare_logo
                  https://syzkaller.appspot.com/bug?extid=0c815b25cdb3678e7083
<3> 18      Yes   KASAN: global-out-of-bounds Read in bit_putcs (3)
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

