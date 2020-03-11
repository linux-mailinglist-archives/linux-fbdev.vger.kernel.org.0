Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A49711814F2
	for <lists+linux-fbdev@lfdr.de>; Wed, 11 Mar 2020 10:34:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728872AbgCKJcg (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 11 Mar 2020 05:32:36 -0400
Received: from mx2.suse.de ([195.135.220.15]:32912 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728255AbgCKJcg (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 11 Mar 2020 05:32:36 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 98CA5B382;
        Wed, 11 Mar 2020 09:32:34 +0000 (UTC)
From:   Takashi Iwai <tiwai@suse.de>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     linux-fbdev@vger.kernel.org
Subject: [PATCH 0/3] video: Use scnprintf() for avoiding potential buffer overflow
Date:   Wed, 11 Mar 2020 10:32:27 +0100
Message-Id: <20200311093230.24900-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi,

here is a series of trivial patches just to convert suspicious
snprintf() usages with the more safer one, scnprintf().


Takashi

===

Takashi Iwai (3):
  video: omapfb: Use scnprintf() for avoiding potential buffer overflow
  video: omap2: Use scnprintf() for avoiding potential buffer overflow
  video: uvesafb: Use scnprintf() for avoiding potential buffer overflow

 drivers/video/fbdev/omap/omapfb_main.c          | 14 +++++++-------
 drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c |  8 ++++----
 drivers/video/fbdev/uvesafb.c                   |  2 +-
 3 files changed, 12 insertions(+), 12 deletions(-)

-- 
2.16.4

