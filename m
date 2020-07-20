Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9A7E226EE7
	for <lists+linux-fbdev@lfdr.de>; Mon, 20 Jul 2020 21:20:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730962AbgGTTS5 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 20 Jul 2020 15:18:57 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:57709 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728874AbgGTTS5 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 20 Jul 2020 15:18:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1595272735;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=1Kbu8ZJB+PbpYpnvxeXN5DGnvBoImp+SwBun1XbwpDw=;
        b=e0F2J7/dBWRF2ANA5jdbc3z5Pg+kkbBwr6HeWdkdtKCutJPjedNzSH3TyJ2WfqYRVrucgD
        bThkCTzQ548BQZNFPmQd8hCbE1j3VK90oWcXBTtaFqJEYDdeLpXAL21ElII4O58GOQ1OV7
        H9X3wIUCnjqfP17rffq89Exhw9CtoRc=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-2NgHycbsM0CrUflxrTidiQ-1; Mon, 20 Jul 2020 15:18:53 -0400
X-MC-Unique: 2NgHycbsM0CrUflxrTidiQ-1
Received: by mail-qk1-f197.google.com with SMTP id x4so3017214qkx.2
        for <linux-fbdev@vger.kernel.org>; Mon, 20 Jul 2020 12:18:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=1Kbu8ZJB+PbpYpnvxeXN5DGnvBoImp+SwBun1XbwpDw=;
        b=LKrt20OhQ1PYGQZgfMvdQy2giBytJW4Tj3/y1OAkCpCloSpC/S/TezdkxQfRVOmmHI
         xn9Fva3hFyePEbfWsLKo0xbpDgKVwaCe00Q+82FeFI4ysLEUcTu7l9xpxYC+HXCPPf/5
         grAvreR12JNATui5MCx92IJuJ7nqO8DNzfXHQUW6I1DtoNLfwm5x1x937E9z7mbJYdWY
         /VYk06CS7xXnO4AvmqL9AfaDAq0iic9xNihFjKcCu+mCLvbKArOrsIhJXouayKFvETla
         rgfI/OyZN0xyXyl5klp+m1iHKdK1yaXz7fr8dGV2XtEdJ5tzP2BRp/HW51gvwiFfbZit
         PVJg==
X-Gm-Message-State: AOAM5333rvFvVkqK2cDlfkfex07FsujHOAfA0XNxojfBEn8nZqhESJqW
        IrIxf/A4CWuU7w7jIiDBIgEISojLyrHZWwqnvKuoWlZn9nd8YR9UkmWS0dlFnyupn2JTSm9fQ4h
        iWejLW4EqAq2K/ahK2c3ptiA=
X-Received: by 2002:ac8:bc2:: with SMTP id p2mr26252066qti.374.1595272733343;
        Mon, 20 Jul 2020 12:18:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnHhkZMNBQS0nyRzKMd1uLYdyrRKd2rgZ6H9zo8r0jm3gmVaJyLQcNPC2s6t9n52ICM5SvqQ==
X-Received: by 2002:ac8:bc2:: with SMTP id p2mr26252034qti.374.1595272733050;
        Mon, 20 Jul 2020 12:18:53 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id c80sm335957qkg.72.2020.07.20.12.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 12:18:52 -0700 (PDT)
From:   trix@redhat.com
To:     b.zolnierkie@samsung.com, jhubbard@nvidia.com, sam@ravnborg.org,
        daniel.vetter@ffwll.ch, gustavo@embeddedor.com, arnd@arndb.de,
        jani.nikula@intel.com
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
Subject: [PATCH] video: fbdev: pvr2fb: initialize variables
Date:   Mon, 20 Jul 2020 12:18:45 -0700
Message-Id: <20200720191845.20115-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

From: Tom Rix <trix@redhat.com>

clang static analysis reports this repesentative error

pvr2fb.c:1049:2: warning: 1st function call argument
  is an uninitialized value [core.CallAndMessage]
        if (*cable_arg)
        ^~~~~~~~~~~~~~~

Problem is that cable_arg depends on the input loop to
set the cable_arg[0].  If it does not, then some random
value from the stack is used.

A similar problem exists for output_arg.

So initialize cable_arg and output_arg.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/video/fbdev/pvr2fb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/fbdev/pvr2fb.c b/drivers/video/fbdev/pvr2fb.c
index 2d9f69b93392..f4add36cb5f4 100644
--- a/drivers/video/fbdev/pvr2fb.c
+++ b/drivers/video/fbdev/pvr2fb.c
@@ -1028,6 +1028,8 @@ static int __init pvr2fb_setup(char *options)
 	if (!options || !*options)
 		return 0;
 
+	cable_arg[0] = output_arg[0] = 0;
+
 	while ((this_opt = strsep(&options, ","))) {
 		if (!*this_opt)
 			continue;
-- 
2.18.1

