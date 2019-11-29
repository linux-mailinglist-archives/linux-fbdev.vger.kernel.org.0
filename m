Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C22F10D6BB
	for <lists+linux-fbdev@lfdr.de>; Fri, 29 Nov 2019 15:12:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726878AbfK2OMi (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 29 Nov 2019 09:12:38 -0500
Received: from smtp.domeneshop.no ([194.63.252.55]:51959 "EHLO
        smtp.domeneshop.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726834AbfK2OMi (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 29 Nov 2019 09:12:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds201810; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=3mCU094ZQX0krTPWJz8llV34hfM4IFj8vzP99YkgB3A=; b=R1+2cvBsoXKhygj+BtHx1xm7bA
        ztXMySFNWcdf6z3oEEPO33wBTzZFifFcKvE37H/Y1Y86PEEPS3Ypvz6qZfwUwKFe7B46xN2o0XhLe
        oMc9/bZAjpX+YckxzHAtfgLJgxmrk2QWnAgV3m5wN1Cxl3uyPf4V9sK6HoXNCaDfmvuXymQKvOqwx
        OMouunzWHFUpfVTzwLAuBLVZk9tAtu+RY1J1hVhj2sOk7UtiVBTyyzoZM/snFQt1N2nUHEQAaSi3/
        K7n10DUKDvWyrnAgthDMMn/hS6GtgvpKbrRJ8p5xQLFeqcdU9UJsxM93RYyj1FDLgnGeZeMxfABOE
        5K2Pz4Hg==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:64572 helo=[192.168.10.174])
        by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1iah0f-0002dV-0h; Fri, 29 Nov 2019 15:12:37 +0100
Subject: Re: [PATCH v2 02/14] drm/fb-helper: don't preserve fb_ops across
 deferred IO use
To:     Jani Nikula <jani.nikula@intel.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Cc:     intel-gfx@lists.freedesktop.org, ville.syrjala@linux.intel.com,
        Daniel Vetter <daniel.vetter@ffwll.ch>
References: <cover.1575022735.git.jani.nikula@intel.com>
 <1eae0b23d4724d5702b886b6a061ec8219eb9284.1575022735.git.jani.nikula@intel.com>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <ba77f1eb-4363-9cbe-2df3-fe645f2bdcb9@tronnes.org>
Date:   Fri, 29 Nov 2019 15:12:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1eae0b23d4724d5702b886b6a061ec8219eb9284.1575022735.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org



Den 29.11.2019 11.29, skrev Jani Nikula:
> Deferred IO now preserves the fb_ops.
> 
> v2: Remove the no-op vfree, drop a local var  (Noralf)
> 
> Cc: Noralf Trønnes <noralf@tronnes.org>
> Cc: dri-devel@lists.freedesktop.org
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
