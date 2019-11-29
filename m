Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10DD110D43B
	for <lists+linux-fbdev@lfdr.de>; Fri, 29 Nov 2019 11:35:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbfK2Kf3 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 29 Nov 2019 05:35:29 -0500
Received: from mga17.intel.com ([192.55.52.151]:17456 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726215AbfK2Kf3 (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 29 Nov 2019 05:35:29 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Nov 2019 02:35:29 -0800
X-IronPort-AV: E=Sophos;i="5.69,257,1571727600"; 
   d="scan'208";a="199774627"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Nov 2019 02:35:26 -0800
From:   Jani Nikula <jani.nikula@intel.com>
To:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v2 10/14] video: constify fb ops across all drivers
In-Reply-To: <c89c23a4393566c09c2372c4d69c851eb2724866.1575022735.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1575022735.git.jani.nikula@intel.com> <c89c23a4393566c09c2372c4d69c851eb2724866.1575022735.git.jani.nikula@intel.com>
Date:   Fri, 29 Nov 2019 12:35:24 +0200
Message-ID: <87k17jkm1f.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, 29 Nov 2019, Jani Nikula <jani.nikula@intel.com> wrote:
> Now that the fbops member of struct fb_info is const, we can start
> making the ops const as well.
>
> This does not cover all drivers; some actually modify the fbops struct,
> for example to adjust for different configurations, and others do more
> involved things that I'd rather not touch in practically obsolete
> drivers. Mostly this is the low hanging fruit where we can add "const"
> and be done with it.
>
> v2:
> - fix typo (Christophe de Dinechin)
> - use "static const" instead of "const static" in mx3fb.c
> - also constify smscufx.c
>
> Cc: linux-fbdev@vger.kernel.org
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> fixup to video drivers

Rebase artefact, to be removed before applying...

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
