Return-Path: <linux-fbdev+bounces-38-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EC47E9F83
	for <lists+linux-fbdev@lfdr.de>; Mon, 13 Nov 2023 16:06:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FD4E280D1D
	for <lists+linux-fbdev@lfdr.de>; Mon, 13 Nov 2023 15:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C21CA2134C;
	Mon, 13 Nov 2023 15:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="mDalR2aB"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAE321102
	for <linux-fbdev@vger.kernel.org>; Mon, 13 Nov 2023 15:06:07 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9465110E5
	for <linux-fbdev@vger.kernel.org>; Mon, 13 Nov 2023 07:06:03 -0800 (PST)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 46A11240106
	for <linux-fbdev@vger.kernel.org>; Mon, 13 Nov 2023 16:06:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1699887961; bh=AysCfJIOEBxPiL99wZ1Aw/KlWYK0Ft/fT6gutzSaLP4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=mDalR2aBzXSIHGPSwLs+VtxO0eZvFt1x08rnI3WKeA+r9+QdZhLWAQCsVkn5+Z3Rl
	 ROyc/yW4GmXZ2cZDWCnZ8sVsDLvtzc053gzofR1L99bEl9v+un+5mwpklhIwgPaLq4
	 nhdRa99J0+WSYhSfonqLpM5Ejyp0qJhGpltqTNqD40FKDdno0nvMqzrug4fRqWxw9t
	 JZElx+Emi1cJzfk8CykC6QCXHp1HUwW2xDMcU3PCLrcvQL/I6hJwVQaDVYZggNCOKo
	 G9jWqRBQrUACNxMF5Kbqbv6lgY5FfioQ90TFlRJsWTVfaTCj9TAVOC94/n5fZ3H5x7
	 kd2g7C0vimbWw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4STXn26xbnz9rxM;
	Mon, 13 Nov 2023 16:05:58 +0100 (CET)
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: 
Cc: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Charalampos Mitrodimas <charmitro@posteo.net>
Subject: [PATCH 0/8] staging: sm750fb: Multiple camel cases renames
Date: Mon, 13 Nov 2023 15:05:05 +0000
Message-Id: <20231113150512.1210869-1-charmitro@posteo.net>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by "checkpatch.pl":
	$ ./scripts/checkpatch.pl --file --terse drivers/staging/sm750fb/ddk750_dvi.c
	drivers/staging/sm750fb/ddk750_dvi.c:19: CHECK: Avoid CamelCase: <sii164GetDeviceID>
	drivers/staging/sm750fb/ddk750_dvi.c:21: CHECK: Avoid CamelCase: <sii164ResetChip>
	drivers/staging/sm750fb/ddk750_dvi.c:22: CHECK: Avoid CamelCase: <sii164GetChipString>
	drivers/staging/sm750fb/ddk750_dvi.c:23: CHECK: Avoid CamelCase: <sii164SetPower>
	drivers/staging/sm750fb/ddk750_dvi.c:24: CHECK: Avoid CamelCase: <sii164EnableHotPlugDetection>
	drivers/staging/sm750fb/ddk750_dvi.c:25: CHECK: Avoid CamelCase: <sii164IsConnected>
	drivers/staging/sm750fb/ddk750_dvi.c:26: CHECK: Avoid CamelCase: <sii164CheckInterrupt>
	drivers/staging/sm750fb/ddk750_dvi.c:27: CHECK: Avoid CamelCase: <sii164ClearInterrupt>
	total: 0 errors, 0 warnings, 8 checks, 62 lines checked

Charalampos Mitrodimas (8):
  staging: sm750fb: Rename sii164GetDeviceID to sii164_get_device_id
  staging: sm750fb: Rename sii164ResetChip to sii164_reset_chip
  staging: sm750fb: Rename sii164GetChipString to sii164_get_chip_string
  staging: sm750fb: Rename sii164SetPower to sii164_set_power
  staging: sm750fb: Rename sii164EnableHotPlugDetection to
    sii164_enable_hot_plug_detection
  staging: sm750fb: Rename sii164IsConnected to sii164_is_connected
  staging: sm750fb: Rename sii164CheckInterrupt to
    sii164_check_interrupt
  staging: sm750fb: Rename sii164ClearInterrupt to
    sii164_clear_interrupt

 drivers/staging/sm750fb/ddk750_dvi.c    | 16 +++++------
 drivers/staging/sm750fb/ddk750_sii164.c | 38 ++++++++++++-------------
 drivers/staging/sm750fb/ddk750_sii164.h | 16 +++++------
 3 files changed, 35 insertions(+), 35 deletions(-)

-- 
2.39.2


