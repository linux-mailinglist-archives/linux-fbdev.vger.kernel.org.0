Return-Path: <linux-fbdev+bounces-4012-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE33A58419
	for <lists+linux-fbdev@lfdr.de>; Sun,  9 Mar 2025 13:42:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA801169BD2
	for <lists+linux-fbdev@lfdr.de>; Sun,  9 Mar 2025 12:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 908C21D6DAD;
	Sun,  9 Mar 2025 12:42:30 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FDD40849
	for <linux-fbdev@vger.kernel.org>; Sun,  9 Mar 2025 12:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741524150; cv=none; b=CdcTn/simQ83znkl859pBY8w1mCdymuQ5aagKjFZI/J9ExoJP/golMbPMaoHIabzMbkVabyOLVhmlRVUOg7sSNdfD5Z0Mo4AR8RRlwMZlcrhBYdq6ggGJbu7aCcn3e2qmFx5UMXa94t7DF8iatofwZc+xT1a68aO0KIlxe8PNzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741524150; c=relaxed/simple;
	bh=dUY4igajBJSOU05hBpX0jx6ZIwrHBUSknInpJw8tohc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=QYuZnsmGBOZiv+cFvtQwlkp4+A0QN/aj8KKVeEWRKkyGux/O04/tEkIPyJNH+c3wyIULMqPmE6j7gu7wabtYiUIhXsPD1848qaqXY80qbputkCcKsyiZ0tKhhhRWwwLP49GcLyfIWlA5bHPwBgzmPUBL/2PaTKh/eGfadxGIRGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-85b3a62e3e5so159236939f.1
        for <linux-fbdev@vger.kernel.org>; Sun, 09 Mar 2025 05:42:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741524148; x=1742128948;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3ml1SgE3f0waN1sWwG+fhNgJQ1Ci3uDZVlghDuLRJ+U=;
        b=mHLLM9SOmSpUeJt4VdwW24hQpV4rwr7pns2qWR1lQIbWHm84ghZEnwzP2h7ae1m3PR
         DYc9kc/fFs+usJc8pWdbY4fKr/eYS8u2JnhVAv67h9AsvugUgICnqutfqacbVLpVJSLx
         yJdBz0JLZhXoaJMZOqjpwT0CK/soOrG0VHeY08apfYGYK595QPZtcnqniVqoUxLqX5ZJ
         UbAYJLBZpIVdJE0ecQnoQmxJEGLrqeJ8BNHjf+nxxY3zlpas7U7Xdh+IWsueiGL+ImGW
         nj8ywh+xJShU8I3Bvi+OSLVs565DakVi9rg+Eh+c7TKtYxgpV9H1U5UQyFOZvYSb8cks
         yZ0g==
X-Forwarded-Encrypted: i=1; AJvYcCUAwCWxUKM1k30KbRdx8tPh0YzR1cAuAfgE/EoN36Ml0xsdps0pwbZB1ZEMzOLpqtBXepeB9w8GxBcwOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6z0HJVON3jVgahYMJVqvuAgXntgRN9UmlxcMRuVrrqly1ZT/9
	QeqBWHp4quAKaueZy1AW69lPa11vrKoMXzgmrBmIazPSCdRMemgB/minU3DfxRjcuJzwC0slMm8
	wezF9CO7GaSP1d7ljXUXHdvD88yErKC2sDy6rX7EM43aP9Gm5fWXpVUw=
X-Google-Smtp-Source: AGHT+IGVFQ7a/Dj9bgaUAxoa893oGc/eseebP95wIMl/jYGyHV4ZZpxmjoRrBWrZF1nQdcnhJTNgx43SQE7abc/0g09SDXfWmTgo
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:174b:b0:3a7:88f2:cfa9 with SMTP id
 e9e14a558f8ab-3d44195a90fmr109227625ab.11.1741524148133; Sun, 09 Mar 2025
 05:42:28 -0700 (PDT)
Date: Sun, 09 Mar 2025 05:42:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67cd8cb4.050a0220.2eb24d.0002.GAE@google.com>
Subject: [syzbot] Monthly fbdev report (Mar 2025)
From: syzbot <syzbot+listd9518ecf1c4edbd09558@syzkaller.appspotmail.com>
To: deller@gmx.de, dri-devel@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello fbdev maintainers/developers,

This is a 31-day syzbot report for the fbdev subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/fbdev

During the period, 1 new issues were detected and 0 were fixed.
In total, 7 issues are still open and 25 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 844     Yes   KASAN: vmalloc-out-of-bounds Write in imageblit (4)
                  https://syzkaller.appspot.com/bug?extid=c4b7aa0513823e2ea880
<2> 15      Yes   KASAN: global-out-of-bounds Read in bit_putcs (3)
                  https://syzkaller.appspot.com/bug?extid=793cf822d213be1a74f2
<3> 8       No    BUG: unable to handle kernel paging request in bitfill_aligned (4)
                  https://syzkaller.appspot.com/bug?extid=66bde8e1e4161d4b2cca
<4> 7       Yes   KASAN: slab-out-of-bounds Read in fbcon_prepare_logo
                  https://syzkaller.appspot.com/bug?extid=0c815b25cdb3678e7083

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

