Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE4EF37F50D
	for <lists+linux-fbdev@lfdr.de>; Thu, 13 May 2021 11:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232549AbhEMJwu (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 13 May 2021 05:52:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230338AbhEMJwt (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 13 May 2021 05:52:49 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3DB5FC061574
        for <linux-fbdev@vger.kernel.org>; Thu, 13 May 2021 02:51:40 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 87E3392009C; Thu, 13 May 2021 11:51:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 792E892009B;
        Thu, 13 May 2021 11:51:35 +0200 (CEST)
Date:   Thu, 13 May 2021 11:51:35 +0200 (CEST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Daniel Vetter <daniel@ffwll.ch>,
        Martin Hostettler <textshell@uchuujin.de>,
        Peilin Ye <yepeilin.cs@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] VT_RESIZEX fixes
Message-ID: <alpine.DEB.2.21.2105131132100.3032@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi,

 This is a minor update to the previous version of the series, adding a 
clarification to 3/3 as to the problem the original fix to which caused 
the functional regression the removal of extra VT_RESIZEX parameter 
handling caused.  No change to actual code.

 See individual change descriptions for details.

 Please apply.

  Maciej
