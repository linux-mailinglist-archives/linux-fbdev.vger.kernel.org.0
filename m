Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F82B6F121
	for <lists+linux-fbdev@lfdr.de>; Sun, 21 Jul 2019 02:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbfGUAeh (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 20 Jul 2019 20:34:37 -0400
Received: from mail-pf1-f171.google.com ([209.85.210.171]:42704 "EHLO
        mail-pf1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725812AbfGUAeg (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 20 Jul 2019 20:34:36 -0400
Received: by mail-pf1-f171.google.com with SMTP id q10so15706391pff.9
        for <linux-fbdev@vger.kernel.org>; Sat, 20 Jul 2019 17:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=resent-from:resent-date:resent-message-id:resent-to:date:from:to
         :subject:message-id:mime-version:content-disposition:user-agent;
        bh=fPe+bDHjpOgFrpj21dr8vqo6XOJjSR6MsyQZPdCCxzM=;
        b=SlyGx0YEHS1nDL/pf3p/eUCOMjH+vvqwFom+xhbsvcamJgifHpSlP6mKNsKKdaO2Kb
         0Nw4fKkYMdzy4SpetlzXIdktDjW9ROmjryKeUXShUESoYjj9GRQ4dN/K4LIPoUJCZRB4
         JaT1e4h8fDMEG+YuKRz5ELdiDT7UhpDb8q2cyWCoGoY4cNu5H2JGkGdhwHWkR4zx+aSG
         4fwH8cggP1Mrrl2UTxfKrLbernN4BW0LdHc/zKFCnROMjokd2bv1F2nKdZTaT66HV4F2
         JEYN0rRTI8BvCZxsMCHQ1VpidMiXb7gAclZnFTPuG9UxdaLZvOpCcxmr2+ORO5wURNNa
         GvSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:resent-from:resent-date:resent-message-id
         :resent-to:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=fPe+bDHjpOgFrpj21dr8vqo6XOJjSR6MsyQZPdCCxzM=;
        b=SK+C/cB6ERW+/QTj8peEygkMCRjT/unEhzFrXSzduht9RWaXTxJBkTJ6kUrb5BQqJn
         OWQ2Vfzuc/4rZDNtdR7M6YgOefL3QCLVCeqeDfjK5OtiVKHzIG4IeukzQ5628QpTE68W
         Z/6mPj4GynV7MGEtzsj2XskPLqAgs3RlKeYmb8vM4bBmbPvsMe2kzXmipLJMWDBW9aVc
         gH8FYoyYUgm45Qbe+S55b17SyPpnwF4tzUQgENL8lRbbMd5pA9ZoF0jY8fmjxQttok+n
         hUCJkxgzLXURBIv/mkxpGADJrWjhdKSkreUTJ5CSor39IAwTdXClrODhey7L3iy8V7iR
         t5yw==
X-Gm-Message-State: APjAAAXzAva4KsrNB656dg9B6uFzjzLmz9JFF330w31awFjqw1O5l9dR
        Abz6ac7eyAuCOfkLbS5wrhh6UkOJhJc=
X-Google-Smtp-Source: APXvYqyCjtOsnLS0eNHVt8jrzwYbKFtM1UoOjjROQctXJBOp9YMqnJmSBFZ0leDwT5EzDPEzI0pLng==
X-Received: by 2002:a65:654f:: with SMTP id a15mr61250566pgw.73.1563669275690;
        Sat, 20 Jul 2019 17:34:35 -0700 (PDT)
Received: from thinkstation (c-73-189-236-31.hsd1.ca.comcast.net. [73.189.236.31])
        by smtp.gmail.com with ESMTPSA id p67sm42828905pfg.124.2019.07.20.17.34.34
        for <linux-fbdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 20 Jul 2019 17:34:35 -0700 (PDT)
Received: from thinkstation (c-73-189-236-31.hsd1.ca.comcast.net. [73.189.236.31])
        by smtp.gmail.com with ESMTPSA id h2sm25088477pgs.17.2019.07.19.07.03.45
        for <oss-security@lists.openwall.com>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jul 2019 07:03:45 -0700 (PDT)
Date:   Fri, 19 Jul 2019 07:03:43 -0700
From:   Tavis Ormandy <taviso@gmail.com>
To:     oss-security@lists.openwall.com
Subject: stack buffer overflow in fbdev
Message-ID: <20190719140343.GA12952@thinkstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hello, during a conversation on twitter we noticed a stack buffer
overflow in fbdev with malicious edid data:

https://github.com/torvalds/linux/blob/22051d9c4a57d3b4a8b5a7407efc80c71c7bfb16/drivers/video/fbdev/core/fbmon.c#L1033

There is enough space to have 52 1-byte length values, which makes svd_n
52, then make the final value length 0x1f (the maximum), which makes
svd_n 83 and overflows the 64 byte stack buffer svd[] with controlled
data.

This requires a malicious monitor / projector / etc, so pretty low impact.

I pulled out the code to make a demo (I removed the checksum, but it
doesnt prevent the bug):

https://gist.github.com/taviso/923776e633cb8fb1ab847cce761a0f10

This was discovered by Nico Waisman of Semmle.

Tavis.

-- 
-------------------------------------
taviso@sdf.lonestar.org | finger me for my pgp key.
-------------------------------------------------------
