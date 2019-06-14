Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 850A7451EC
	for <lists+linux-fbdev@lfdr.de>; Fri, 14 Jun 2019 04:32:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725777AbfFNCcd (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 13 Jun 2019 22:32:33 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:46483 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbfFNCcd (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 13 Jun 2019 22:32:33 -0400
Received: by mail-pg1-f196.google.com with SMTP id v9so601190pgr.13
        for <linux-fbdev@vger.kernel.org>; Thu, 13 Jun 2019 19:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=Po2RPMC2YO1kfuno4F5znl/XLXzbNv7hZgPyyC5n0VE=;
        b=DnfW7CRaxue2mTMzURxVYRxgqmgUc8/JumpQo590jGbccOT30UT/5fkwbE3yWrie7Y
         eSB9wxkx/g+ye3AKrETSi4fRkUg4aCE+MZCNEAjmsFZRIwRkdwyft3jxVido9qNV5z7d
         D6ARrSwL7sPjhaK2BZROPTpWMwsPBFuV2j44n9TJAKmMO55txDvJ5lxOkuIWWPzNN3Cr
         HsqvwQe5fJ+T/Dqg02EdNJ5yKv7vzWcefkY5NQ0f9SBOULJLItfVu4wXml06a/oDbrBj
         1SIF3zQM3ROndu6UopZxtgIHvTVRORKune9xGP3KfHJr5cNL6SYVjJ5MZSsYUDzFyjdx
         +KHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=Po2RPMC2YO1kfuno4F5znl/XLXzbNv7hZgPyyC5n0VE=;
        b=a7PiRtUDZgfmwopj6FTQveWZ8GCXjSeip6jStYwMjJdeLY0GcdoS3OvVX3qz/oK+Td
         WfDb0EJOm/iK47cBrs/pYWXR8Hj87Drc0McwEiznrn8a830oGf4qaxj1J2nfWkXVo/mh
         Vbk/mTN+nm1wLa5vf6cNrUxGKpfCUG08LoIXHDXLI8SJjITNDe4UXqLcHhUNHjv44SkQ
         ThvmOZgyOF26rjBLYuV2zE30w1jb4wkb3QqRkRVCY/GenNn0dEG6aovHzMnXBrbL4A0W
         utndtViBB+rzhKkHrv1HeAkDiyxjjIAIQ1sEGa3KpmqnV2l2Tvfwh03pucJ4lua6ePUC
         HPlg==
X-Gm-Message-State: APjAAAUOxQcJG2W4I7CTNoAEeH+XngDlG2S1nnCxq3ZWGix8ppAbnO/p
        4rKR9ZfkMgw3mMMJ5ZhdAj7UIXzUghU=
X-Google-Smtp-Source: APXvYqyg7Mk8RiPSvWKZy1fhd/L5/sfeY1xok8PLV93AhLV+v449B9jYYij1sjbXhwdBfCChBeFH/Q==
X-Received: by 2002:a63:545a:: with SMTP id e26mr33069331pgm.162.1560479551359;
        Thu, 13 Jun 2019 19:32:31 -0700 (PDT)
Received: from t-1000 (c-98-210-58-162.hsd1.ca.comcast.net. [98.210.58.162])
        by smtp.gmail.com with ESMTPSA id h12sm1362648pje.12.2019.06.13.19.32.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 19:32:30 -0700 (PDT)
Date:   Thu, 13 Jun 2019 19:32:28 -0700
From:   Shobhit Kukreti <shobhitkukreti@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Cc:     shobhitkukreti@gmail.com
Subject: [PATCH] staging: fbtft: Fix checkpatch ERROR: space prohibited
 before that close parenthesis ')'
Message-ID: <20190614023225.GA27938@t-1000>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Cleaned up code to resolve  the checkpatch error
ERROR: space prohibited before that close parenthesis ')'
from the file:

fbtft/fbtft-bus.c

Signed-off-by: Shobhit Kukreti <shobhitkukreti@gmail.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 2ea814d..2b43bc2 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -62,9 +62,9 @@ out:									      \
 }                                                                             \
 EXPORT_SYMBOL(func);
 
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8,)
 define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16,)
 
 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
-- 
2.7.4

