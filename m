Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6630BE792D
	for <lists+linux-fbdev@lfdr.de>; Mon, 28 Oct 2019 20:24:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730517AbfJ1TYs (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 28 Oct 2019 15:24:48 -0400
Received: from smtp09.smtpout.orange.fr ([80.12.242.131]:17998 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728941AbfJ1TYs (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 28 Oct 2019 15:24:48 -0400
Received: from belgarion ([90.55.204.252])
        by mwinf5d17 with ME
        id K7Ql2100Y5TFNlm037Qmxd; Mon, 28 Oct 2019 20:24:46 +0100
X-ME-Helo: belgarion
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Mon, 28 Oct 2019 20:24:46 +0100
X-ME-IP: 90.55.204.252
From:   Robert Jarzmik <robert.jarzmik@free.fr>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 08/46] ARM: pxa: move regs-lcd.h into driver
References: <20191018154052.1276506-1-arnd@arndb.de>
        <20191018154201.1276638-8-arnd@arndb.de>
X-URL:  http://belgarath.falguerolles.org/
Date:   Mon, 28 Oct 2019 20:24:45 +0100
In-Reply-To: <20191018154201.1276638-8-arnd@arndb.de> (Arnd Bergmann's message
        of "Fri, 18 Oct 2019 17:41:23 +0200")
Message-ID: <87zhhkn05e.fsf@belgarion.home>
User-Agent: Gnus/5.130008 (Ma Gnus v0.8) Emacs/26 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Arnd Bergmann <arnd@arndb.de> writes:

> Only the pxafb driver uses this header, so move it into the
> same directory. The SMART_* macros are required by some
> platform data definitions and can go into the
> linux/platform_data/video-pxafb.h header.
>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

--
Robert
