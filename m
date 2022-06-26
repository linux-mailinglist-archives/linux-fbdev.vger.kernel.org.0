Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2969855B07C
	for <lists+linux-fbdev@lfdr.de>; Sun, 26 Jun 2022 10:57:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231403AbiFZI4X (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 26 Jun 2022 04:56:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbiFZI4W (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sun, 26 Jun 2022 04:56:22 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC20711A21
        for <linux-fbdev@vger.kernel.org>; Sun, 26 Jun 2022 01:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1656233776;
        bh=4JAuHaTLkz/JzLra4c18B+NmRKbJo0riSTivAcu/sJY=;
        h=X-UI-Sender-Class:From:To:Subject:Date;
        b=C9eTeVKUgKK4Q6PNeNa6vCXTc8J2sFojexwTdm9dkxZ+XMJDwF6GG/bq351xCeOvJ
         95ll91OQNo7sTm/ZkeksO0LnHAhjNUXLEfbf3DAU7isP40g5f5tNqCy0k7VHAyAi5X
         jpWkmImRXOs1y1IeKZAElJ/0ITGo7S+7F4QhNCNo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.135.166]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M4s4r-1o7IwR19j5-001x4b; Sun, 26
 Jun 2022 10:56:16 +0200
From:   Helge Deller <deller@gmx.de>
To:     dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch,
        linux-fbdev@vger.kernel.org
Subject: [PATCH v5 0/4] fbcon: Fixes for screen resolution changes
Date:   Sun, 26 Jun 2022 10:56:11 +0200
Message-Id: <20220626085615.53728-1-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6WYwd5gOQ7tonxkhAAO1TF0Js4BLQQvOzKW7x2PuJrIBko/g9Pj
 ZTzHffgui7A2vLV/WhEADI62PT5DVxC79X1HTmNHCybTc+SdAQKr+WS82We0odaFuMcE9u8
 tk2mXOpD2GYHvHdUpx9OOYbZtdGEJU2YKguvZdTRDVSNZMeICKVOl1LZtVsf0LsDL9dpi3m
 TymYY/+x4liFypsDVwYWw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ck5oGGMOf7c=:GABgZh38PdfBrhCiDTsR/5
 Xq1OfRlHt/BaOcNedaqnTDQgwsmC+4WJ3RDyOhWl6gmX791ThawFY3C4SLc1ClIfH9iOeP3gb
 u2B9GZQTBBOsj2o5H+UdD1QzWC6lz9tM8yCabkgdaxp6aLf2P8cbn/B5pBJpTudidNnOkxsSW
 SQeQfJR0vhHW9iKv85hU0pJJMwGSK9yhOhs+Uboc4uIH8i307sQeIITDEd10nJBxyDa7WYIuj
 v8MbnWNgbvlSw6S3WfnFkLIZzqXLMjM/nzEEta20GbI+c14LVcP+8VPwOPe6xeOr5FfhA+qOQ
 aM1R/JopY0927RD8h9n+WBRAStyHazSutUUiNJFcl5MB73HIhpYZbi+x+rmftGaxUGF/wzT0N
 8WoTsIEoW04cEsC2pTklSbY7a2RMDsXSU2MNmw/fa+padCLl6pJLyNlvG7mmIZbKuWaMJ9Eqd
 wJthqsbIC/Mtj9bhIlMu72pqTH/RQgXwapyInu22vXEG8palhr6UnJ2xeA04+lZMz5xvaGkgL
 hlI/tXJsFuatqZ8zxCIk2TbUlv1xfWhPz5SJ0E5wl3xhstbfybJeAki5TH2UWTK4WYnc0Y209
 RjpMuHv50K6iF1oYxayNmIqd1qPDsS5QWNNiWCguXs58cWM1WMSs8mX6IEQl1aK/kdl1LQWcS
 +pZhKLkD4rPz+holUmYom87ZXvfh466roJC63xK2uJ7gG/a66eergCVppLzCKKWbASl1un6a1
 9R19QwvSwpV1radmkVQju/pP+SBYw55dYMZgV5tlLkH0oXL8YAQDLw2LFiS1XsPyNMtSDXy+D
 Lszha1O5CNeLwDhop5XVeVXIi+9l21jbnFxU2I0mK9s8RGflO5UlmSNZMO3S77dacX7enaO4j
 EKDshRFC8uYvb7QoOj60Ko27f09zMZ+c/rbgiMhQkOUJVXvMV5Y+SaBL0Ay7iYHWPZ54VRHIC
 9MzoJ8WrD86YHF8KV17ctZ7AG7m0PNFuwKhD4LEG3kWISHKQt5hvlVGYOoS7KFfwXinfl+jZ3
 fwibK0bKsgU1fTR8L0Bvy5MvvN+Jh4a4dl3FZGRXN50dWTCFTZIoq9HLg8t81qJZV3lg2XiG/
 iGLvFySa2jVQEkiqV7fCmFgeqgKz4L883BlpPJSLq83F1ni9hQ0MXjikg==
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

This series fixes possible out-of-bound memory accesses when users trigger
screen resolutions changes with invalid input parameters, e.g. reconfigure=
s
screen which is smaller than the current font size, or if the virtual scre=
en
size is smaller than the physical screen size.

Major change in this version v5 is that since we can't easily push
commit 409d6c95f9c6 ("fbcon: Introduce wrapper for console->fb_info lookup=
")
downwards, a new patch #4 to clean up the old usage of "registered_fb[con2=
fb_map[i]]"
afterwards has been added.

v5:
- swapped patch #2 and #3
- modified patch #3 to use registered_fb[con2fb_map[i]] instead of
  fbcon_info_from_console(). This is necessary that the patch can
  be cleanly pushed back to v5.4
- added cleanup patch #4 to fix up patch #3 again to use fbcon_info_from_c=
onsole()
  for v5.19+

v4:
- merged former patch #2 and #3
- added more Reviewed-by
- new patch #2 needs more testing. Note added to comit message that
  another patch needs to be backport as well.

Helge Deller (4):
  fbcon: Disallow setting font bigger than screen size
  fbmem: Prevent invalid virtual screen sizes
  fbcon: Prevent that screen size is smaller than font size
  fbcon: Use fbcon_info_from_console() in fbcon_modechange_possible()

 drivers/video/fbdev/core/fbcon.c | 32 ++++++++++++++++++++++++++++++++
 drivers/video/fbdev/core/fbmem.c | 10 +++++++++-
 include/linux/fbcon.h            |  4 ++++
 3 files changed, 45 insertions(+), 1 deletion(-)

=2D-
2.35.3

