Return-Path: <linux-fbdev+bounces-3388-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 174489E048F
	for <lists+linux-fbdev@lfdr.de>; Mon,  2 Dec 2024 15:14:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB493B27CA5
	for <lists+linux-fbdev@lfdr.de>; Mon,  2 Dec 2024 12:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7AF1FE46A;
	Mon,  2 Dec 2024 12:47:33 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739341FDE1A
	for <linux-fbdev@vger.kernel.org>; Mon,  2 Dec 2024 12:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733143653; cv=none; b=sjeejMfs64upfnQWHmTRPfluVr0rmPey2ZPKUKAv6nDtnp0cMGYXZutr17L5Xhzajl8BcY1V3o1tzuwaUHZpGZCe72QS0bZe87WFyunqT0buIWqUXQhbqvd4gX2Q7ZfIdZvm1IwTBsDgn6WAlmEhWhlV6l/8BPrJ+jYyCdXDwR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733143653; c=relaxed/simple;
	bh=9P0r0zNtzk16/yn3eCLGd/0ueemYp1923g9x8YNPPMM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=DE4j+W2nonIvloBp7/VZg2AG8Xke0kpPn9D6YihF+eGhlXOtjA4/h7GrdZN0BXDV/nyziLHeg5yHRqg/RN/q8/fgHXubYl9D1bTrCNcjKDzN3wg3fF9Nfi/90irgVkZk08P7gS0ki7dpOiLLm4BUVuo70fQ0ldo9hUW3u8zhsx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3a7e0d7b804so24688845ab.0
        for <linux-fbdev@vger.kernel.org>; Mon, 02 Dec 2024 04:47:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733143651; x=1733748451;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M09ZTevdyJ7SCNEPvgTNBuDdXmgGLWhWSZRFEBkOlCs=;
        b=FXL0uNHMx/+brU9oVCIlSe7zLlQAingmJWUfTZSHQnzd3vxIIOtgafvqdgBJw37Jxv
         Z8a34hpfFxPSJqm+7vCQxk/bUjwG0vjH7NwcyxA01K3k38SwQVKQouRq+O1dx244PLnq
         zIom4Ufm6hRcNAljTOMNExAPrM4wTxgevVfVBkaaBb32dCXohuaGBQoj+WGNlPetx6Sb
         yeUImBut4jrDOWFivdfpBay774dPFUkU9fCl9NKsQ9H+x6r8LscTPYtsqL2qsBgg4nDc
         +TlNEW7HNimhawiFLgKb1wHJs7VV3Nq7SFuMC1Ma515h0fZTlqRuTzFexWKhzOo3cM5k
         QOeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaxClVH6X15nRnbdyYgCYf9IkbnzKjGtZBVbzAodOfsiY5q4So0CM7yfW5V6wjs642m4ULhKrPXn2FZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNvRcLjwQv0BjT02upg6tdf6th4lr5buNj9RLDi5vmShfJDrne
	nojuyDnbSAofpfQ5ppqD+TLCi8MB+Mw/PoVfTjrDoyA8iVIJb2jxOdqJjQVLHsY5eOJCQRTeYd4
	TwqIolD1b/C50Eh6yYRKAO+QnTjogKxdnfPbRfcoBEYaW7hDPCRgYsPQ=
X-Google-Smtp-Source: AGHT+IEkKK2rk/vQaS4je5HYiSTlE7kNsErcMTVM+tErhOOyoKgeF2aOrCv//Y7CGBZOK6vkfjyUO6ygj6W6TQx9HlnFBu+UpDqM
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1806:b0:3a7:8720:9e9e with SMTP id
 e9e14a558f8ab-3a7c552531bmr245731245ab.2.1733143651553; Mon, 02 Dec 2024
 04:47:31 -0800 (PST)
Date: Mon, 02 Dec 2024 04:47:31 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <674dac63.050a0220.ad585.0050.GAE@google.com>
Subject: [syzbot] Monthly fbdev report (Dec 2024)
From: syzbot <syzbot+list22da73323ba5f509dc01@syzkaller.appspotmail.com>
To: deller@gmx.de, dri-devel@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello fbdev maintainers/developers,

This is a 31-day syzbot report for the fbdev subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/fbdev

During the period, 0 new issues were detected and 0 were fixed.
In total, 4 issues are still open and 25 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 276     Yes   KASAN: vmalloc-out-of-bounds Write in imageblit (4)
                  https://syzkaller.appspot.com/bug?extid=c4b7aa0513823e2ea880
<2> 7       No    KASAN: global-out-of-bounds Read in bit_putcs (3)
                  https://syzkaller.appspot.com/bug?extid=793cf822d213be1a74f2
<3> 2       No    KASAN: slab-out-of-bounds Read in fb_pad_unaligned_buffer (2)
                  https://syzkaller.appspot.com/bug?extid=6649e4a17d8ebca21a28

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

