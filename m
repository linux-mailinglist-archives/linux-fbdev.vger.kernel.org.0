Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E8F41497A9
	for <lists+linux-fbdev@lfdr.de>; Sat, 25 Jan 2020 20:55:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729221AbgAYTzM (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 25 Jan 2020 14:55:12 -0500
Received: from 216-12-86-13.cv.mvl.ntelos.net ([216.12.86.13]:52972 "EHLO
        brightrain.aerifal.cx" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729203AbgAYTzL (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 25 Jan 2020 14:55:11 -0500
Received: from dalias by brightrain.aerifal.cx with local (Exim 3.15 #2)
        id 1ivRWN-0004pl-00; Sat, 25 Jan 2020 19:55:07 +0000
Date:   Sat, 25 Jan 2020 14:55:06 -0500
From:   Rich Felker <dalias@libc.org>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH] matroxfb: add Matrox MGA-G200eW board support
Message-ID: <20200125195506.GA16638@brightrain.aerifal.cx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Signed-off-by: Rich Felker <dalias@libc.org>
--
I've had this lying around a while and figure I should send it
upsteam; it's needed to support the onboard video on my Spectre-free
Atom S1260 server board.

---
 drivers/video/fbdev/matrox/matroxfb_base.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/video/fbdev/matrox/matroxfb_base.c b/drivers/video/fbdev/matrox/matroxfb_base.c
index 1a555f70923a..ff344313860c 100644
--- a/drivers/video/fbdev/matrox/matroxfb_base.c
+++ b/drivers/video/fbdev/matrox/matroxfb_base.c
@@ -1376,6 +1376,12 @@ static struct video_board vbG200 = {
 	.accelID = FB_ACCEL_MATROX_MGAG200,
 	.lowlevel = &matrox_G100
 };
+static struct video_board vbG200eW = {
+	.maxvram = 0x800000,
+	.maxdisplayable = 0x800000,
+	.accelID = FB_ACCEL_MATROX_MGAG200,
+	.lowlevel = &matrox_G100
+};
 /* from doc it looks like that accelerator can draw only to low 16MB :-( Direct accesses & displaying are OK for
    whole 32MB */
 static struct video_board vbG400 = {
@@ -1494,6 +1500,13 @@ static struct board {
 		MGA_G200,
 		&vbG200,
 		"MGA-G200 (PCI)"},
+	{PCI_VENDOR_ID_MATROX,	0x0532,	0xFF,
+		0,			0,
+		DEVF_G200,
+		250000,
+		MGA_G200,
+		&vbG200eW,
+		"MGA-G200eW (PCI)"},
 	{PCI_VENDOR_ID_MATROX,	PCI_DEVICE_ID_MATROX_G200_AGP,	0xFF,
 		PCI_SS_VENDOR_ID_MATROX,	PCI_SS_ID_MATROX_GENERIC,
 		DEVF_G200,
@@ -2136,6 +2149,8 @@ static const struct pci_device_id matroxfb_devices[] = {
 		PCI_ANY_ID,	PCI_ANY_ID,	0, 0, 0},
 	{PCI_VENDOR_ID_MATROX,	PCI_DEVICE_ID_MATROX_G200_PCI,
 		PCI_ANY_ID,	PCI_ANY_ID,	0, 0, 0},
+	{PCI_VENDOR_ID_MATROX,	0x0532,
+		PCI_ANY_ID,	PCI_ANY_ID,	0, 0, 0},
 	{PCI_VENDOR_ID_MATROX,	PCI_DEVICE_ID_MATROX_G200_AGP,
 		PCI_ANY_ID,	PCI_ANY_ID,	0, 0, 0},
 	{PCI_VENDOR_ID_MATROX,	PCI_DEVICE_ID_MATROX_G400,
-- 
2.21.0

