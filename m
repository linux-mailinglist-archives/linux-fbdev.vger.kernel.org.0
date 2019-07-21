Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D43CB6F4D0
	for <lists+linux-fbdev@lfdr.de>; Sun, 21 Jul 2019 20:54:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727296AbfGUSyo (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 21 Jul 2019 14:54:44 -0400
Received: from smtp10.smtpout.orange.fr ([80.12.242.132]:27853 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbfGUSyn (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sun, 21 Jul 2019 14:54:43 -0400
Received: from [192.168.1.41] ([92.140.204.221])
        by mwinf5d45 with ME
        id fWug2000B4n7eLC03Wugz6; Sun, 21 Jul 2019 20:54:41 +0200
X-ME-Helo: [192.168.1.41]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 21 Jul 2019 20:54:41 +0200
X-ME-IP: 92.140.204.221
X-Mozilla-News-Host: news://news.gmane.org:119
To:     Greg KH <gregkh@linuxfoundation.org>, nishadkamdar@gmail.com,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Kernel Janitors <kernel-janitors@vger.kernel.org>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [RFC] Staging: fbtft: Typo in
Message-ID: <f4881a63-8702-55f2-ed03-cfbc30970083@wanadoo.fr>
Date:   Sun, 21 Jul 2019 20:54:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi,

looking at the code in 'drivers/staging/fbtft/fb_pcd8544.c', there seems 
to be some typos.

At the end of the file, we can find:

FBTFT_REGISTER_DRIVER(DRVNAME, "philips,pdc8544", &display);
...
MODULE_ALIAS("spi:pdc8544");


It is likely that the 2 pdc8544 should be pcd8544. (d and c switched)

As I don't know the implication of such a change, I prefer to first 
report the potential issue, before proposing a patch for it.

Any feedback back appreciated.

Best regards,
Christophe JAILLET

