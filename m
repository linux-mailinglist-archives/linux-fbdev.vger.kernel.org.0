Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8983970A3
	for <lists+linux-fbdev@lfdr.de>; Wed, 21 Aug 2019 06:01:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725385AbfHUEBM (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 21 Aug 2019 00:01:12 -0400
Received: from condef-06.nifty.com ([202.248.20.71]:58586 "EHLO
        condef-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbfHUEBM (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 21 Aug 2019 00:01:12 -0400
Received: from conuserg-07.nifty.com ([10.126.8.70])by condef-06.nifty.com with ESMTP id x7L3tqG1019640
        for <linux-fbdev@vger.kernel.org>; Wed, 21 Aug 2019 12:55:52 +0900
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id x7L3tQp1016439;
        Wed, 21 Aug 2019 12:55:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x7L3tQp1016439
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1566359727;
        bh=ZLgV4koGuRryubL/TOhgUZDXaC6w+rsrQk3BXi0A+BY=;
        h=From:To:Cc:Subject:Date:From;
        b=jJgX5I2TqWbW5oPGco9DAJtRucNgVC5rqJU1q5p7bkg7ztpoWtK4ChUD9s6nrYMWr
         Df0PmixW4cvgaKelhl5ljqeZneLHGo3+PFu/HYaiOtIIKfoEehoFnLZzJz4clvIvan
         AMdHJRXb8KfV+X6sniQIWlmppAYv0P8qu/br3U52T9EF6+SG1iEJ60TGxoDAPTNWau
         f+piWeYfmgyHwwiQb9ZqTlx1kr3LgQFLOOdG7Jj+U4eoJ1guKLf9X7IpzlrXjkOqo9
         M4kNrj5YlJza2+dBDatLbsnhYlNONvpCwbtPIsIDNkeRBkgSW/FaDnLlveKUqTLpdE
         iG0XcLnqd9LUQ==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] video/logo: various fix and cleanups of drivers/video/logo/Makefile
Date:   Wed, 21 Aug 2019 12:55:12 +0900
Message-Id: <20190821035517.21671-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org




Masahiro Yamada (4):
  video/logo: remove unneeded *.o pattern from clean-files
  video/logo: fix unneeded generation of font C files
  video/logo: simplify cmd_logo
  video/logo: move pnmtologo tool to drivers/video/logo/ from scripts/

 drivers/video/logo/.gitignore               |  1 +
 drivers/video/logo/Makefile                 | 36 ++++-----------------
 {scripts => drivers/video/logo}/pnmtologo.c |  0
 scripts/.gitignore                          |  1 -
 scripts/Makefile                            |  2 --
 5 files changed, 8 insertions(+), 32 deletions(-)
 rename {scripts => drivers/video/logo}/pnmtologo.c (100%)

-- 
2.17.1

