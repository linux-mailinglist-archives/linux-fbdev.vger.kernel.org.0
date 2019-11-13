Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE01AFB3B3
	for <lists+linux-fbdev@lfdr.de>; Wed, 13 Nov 2019 16:27:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727793AbfKMP1U (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 13 Nov 2019 10:27:20 -0500
Received: from smtp.domeneshop.no ([194.63.252.55]:57241 "EHLO
        smtp.domeneshop.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727721AbfKMP1U (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 13 Nov 2019 10:27:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds201810; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=H3cBhEL11TGC3fnSyP5Uz6kpf1ieE2CexsDAQNrKRMk=; b=dWTVEzq8AVJUFgT0XnDVseKSbJ
        Epk0zNq7pDL4zUFVIItRub2ov743QmczScDiDqeKFLjiiV4ePKEo9SEbRfnT0a3bi3e5R7SYuW72G
        yZIIez3vEpJtIsgALmJmtavusX1eILGYL4qOoiF3m03P0Td2nhPyYAtytXFNw6WnpC1kHhEDm/uFh
        giREU2UG0g9n17CbWkDsIk6fOsAkF5GUGa4aiw2SqyXG3vrDe5l2DHqqjjBby5YsP0ueKiyA+l/wb
        TxwU45xzkP7uOQEe9iq2AiTtwvEFB7bbOuFtixtbj6cBCQSH0wkya7nzpncihgdQRoKCL2tctyMCG
        cvdDtNBQ==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:58970 helo=[192.168.10.173])
        by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1iUuY9-0003UG-VO; Wed, 13 Nov 2019 16:27:17 +0100
Subject: Re: [PATCH v4 3/3] fbdev: Unexport unlink_framebuffer()
To:     Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
        sean@poorly.run, daniel@ffwll.ch, b.zolnierkie@samsung.com,
        kraxel@redhat.com, sam@ravnborg.org, emil.velikov@collabora.com
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20191113115233.18483-1-tzimmermann@suse.de>
 <20191113115233.18483-4-tzimmermann@suse.de>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <26c62d04-760e-cecc-3642-d91b083b12e5@tronnes.org>
Date:   Wed, 13 Nov 2019 16:27:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191113115233.18483-4-tzimmermann@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org



Den 13.11.2019 12.52, skrev Thomas Zimmermann:
> There are no external callers of unlink_framebuffer() left. Make the
> function an internal interface.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
